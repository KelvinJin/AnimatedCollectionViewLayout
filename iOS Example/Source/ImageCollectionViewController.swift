//
//  ViewController.swift
//  iOS Example
//
//  Created by Jin Wang on Feb 8, 2017.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class SimpleCollectionViewCell: UICollectionViewCell {
    
    // @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
    private let titleLabel = UILabel(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        addSubview(titleLabel)
        
        let horizontalCenterConstraint = NSLayoutConstraint(item: titleLabel,
                                                            attribute: .centerX,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .centerX,
                                                            multiplier: 1.0,
                                                            constant: 0)
        
        let verticalCenterConstraint = NSLayoutConstraint(item: titleLabel,
                                                          attribute: .centerY,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .centerY,
                                                          multiplier: 1.0,
                                                          constant: 0)
        
        addConstraint(horizontalCenterConstraint)
        addConstraint(verticalCenterConstraint)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .white
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "nature3")
    }
    
    func bind(color: String, imageName: String) {
        contentView.backgroundColor = color.hexColor
        titleLabel.text = "\(arc4random_uniform(1000))"
    }
}

extension String {
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

class ImageCollectionViewController: UICollectionViewController {

    @IBOutlet var dismissGesture: UISwipeGestureRecognizer!
    
    var animator: (LayoutAttributesAnimator, Bool, Int, Int)?
    var direction: UICollectionView.ScrollDirection = .horizontal
    
    let cellIdentifier = "SimpleCollectionViewCell"
    let vcs = [("f44336", "nature1"),
               ("9c27b0", "nature2"),
               ("3f51b5", "nature3"),
               ("03a9f4", "animal1"),
               ("009688", "animal2"),
               ("8bc34a", "animal3"),
               ("FFEB3B", "nature1"),
               ("FF9800", "nature2"),
               ("795548", "nature3"),
               ("607D8B", "animal1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Turn on the paging mode for auto snaping support.
        collectionView?.isPagingEnabled = true
        
        if let layout = collectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
            layout.scrollDirection = direction
            layout.animator = animator?.0
        }
        
        dismissGesture.direction = direction == .horizontal ? .down : .left
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSwipeDown(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
}

extension ImageCollectionViewController: UICollectionViewDelegateFlowLayout {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(Int16.max)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        if let cell = c as? SimpleCollectionViewCell {
            let i = indexPath.row % vcs.count
            let v = vcs[i]
            cell.bind(color: v.0, imageName: v.1)
            cell.clipsToBounds = animator?.1 ?? true
        }
        
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let animator = animator else { return view.bounds.size }
        return CGSize(width: view.bounds.width / CGFloat(animator.2), height: view.bounds.height / CGFloat(animator.3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

