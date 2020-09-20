//
//  ParallexAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

/// An animator that implemented the parallax effect by moving the content of the cell
/// slower than the cell itself.
public struct ParallaxAttributesAnimator: LayoutAttributesAnimator {
    /// The higher the speed is, the more obvious the parallax. 
    /// It's recommended to be in range [0, 1] where 0 means no parallax. 0.5 by default.
    public var speed: CGFloat
    
    public init(speed: CGFloat = 0.5) {
        self.speed = speed
    }
    
    public func animate(collectionView: UICollectionView, attributes: AnimatedCollectionViewLayoutAttributes) {
        let position = attributes.middleOffset
        let direction = attributes.scrollDirection
        
        guard let contentView = attributes.contentView else { return }
        
        if abs(position) >= 1 {
            // Reset views that are invisible.
            contentView.frame = attributes.bounds
        } else if direction == .horizontal {
            let width = collectionView.frame.width
            let transitionX = -(width * speed * position)
            let transform = CGAffineTransform(translationX: transitionX, y: 0)
            let newFrame = attributes.bounds.applying(transform)
            
            if #available(iOS 14, *) {
                contentView.transform = transform
            } else {
                contentView.frame = newFrame
            }
            
        } else {
            let height = collectionView.frame.height
            let transitionY = -(height * speed * position)
            let transform = CGAffineTransform(translationX: 0, y: transitionY)
            
            // By default, the content view takes all space in the cell
            let newFrame = attributes.bounds.applying(transform)
            
            // We don't use transform here since there's an issue if layoutSubviews is called 
            // for every cell due to layout changes in binding method.
            //
            // Update for iOS 14: It seems that setting frame of content view
            // won't work for iOS 14. And transform on the other hand doesn't work pre iOS 14
            // so we adapt the changes here.
            if #available(iOS 14, *) {
                contentView.transform = transform
            } else {
                contentView.frame = newFrame
            }
        }
    }
}
