//
//  ParallexAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct ParallaxAttributesAnimator: LayoutAttributesAnimator {
    public var speed: CGFloat
    
    public init(speed: CGFloat = 0.5) {
        self.speed = speed
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        if abs(position) >= 1 {
            // Out of visible.
            attributes.contentView?.transform = .identity
        } else {
            // Transformation
            let width = collectionView.frame.width
            let transitionX = -(width * speed * position)
            attributes.contentView?.transform = CGAffineTransform(translationX: transitionX, y: 0)
        }
    }
}
