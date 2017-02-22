//
//  AnimatorTableViewController.swift
//  iOS Example
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class AnimatorTableViewController: UITableViewController {
    
    private let animators: [(LayoutAttributesAnimator, Bool)] = [(ParallaxAttributesAnimator(), true),
                                                         (ZoomInOutAttributesAnimator(), true),
                                                         (RotateInOutAttributesAnimator(), true),
                                                         (LinearCardAttributesAnimator(), false),
                                                         (CubeAttributesAnimator(), true),
                                                         (CrossFadeAttributesAnimator(), true),
                                                         (SnapInAttributesAnimator(), true),
                                                         (PageAttributesAnimator(), true)]
    
    @IBOutlet weak var isHorizontalScrollToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dist = segue.destination as? ImageCollectionViewController, let indexPath = sender as? IndexPath {
            dist.animator = animators[indexPath.row]
            dist.direction = isHorizontalScrollToggle.isOn ? .horizontal : .vertical
        }
    }
    
    // MARK: - TableView Delegate and DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animators.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        c.textLabel?.font = UIFont.systemFont(ofSize: 12)
        c.textLabel?.text = "\(animators[indexPath.row].0.self)"
        
        return c
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowCollectionViewController", sender: indexPath)
    }
}
