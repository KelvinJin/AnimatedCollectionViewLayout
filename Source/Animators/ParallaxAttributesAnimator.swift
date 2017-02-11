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
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        if abs(position) >= 1 {
            // Reset views that are invisible.
            attributes.contentView?.transform = .identity
        } else {
            let width = collectionView.frame.width
            let transitionX = -(width * speed * position)
            attributes.contentView?.transform = CGAffineTransform(translationX: transitionX, y: 0)
        }
    }
}
