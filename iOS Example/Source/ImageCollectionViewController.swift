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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // clipsToBounds = false
    }
    
    func bind(text: String, imageName: String) {
        titleLabel.text = text
        imageView.image = UIImage(named: imageName)
    }
}

class ImageCollectionViewController: UICollectionViewController {

    var animator: (LayoutAttributesAnimator, Bool)?
    
    let cellIdentifier = "SimpleCollectionViewCell"
    let vcs = [("Arts", "nature1"),
               ("Business", "nature2"),
               ("UI/UX", "nature3"),
               ("Crazy Tiger", "animal1"),
               ("Cat", "animal2"),
               ("Rex Doggy", "animal3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Must turn paging on.
        collectionView?.isPagingEnabled = true
        
        if let layout = collectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
            layout.animator = animator?.0
        }
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
        return vcs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        if let cell = c as? SimpleCollectionViewCell {
            let v = vcs[indexPath.row]
            cell.bind(text: v.0, imageName: v.1)
            cell.clipsToBounds = animator?.1 ?? true
        }
        
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
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

