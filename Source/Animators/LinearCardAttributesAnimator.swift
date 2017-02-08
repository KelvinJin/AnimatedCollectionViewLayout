//
//  LinearCardAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

// ClipsToBounds = false
public struct LinearCardAttributeAnimator: LayoutAttributesAnimator {
    public var minAlpha: CGFloat
    public var itemSpacing: CGFloat
    public var scaleRate: CGFloat
    
    public init(minAlpha: CGFloat = 0.5, itemSpacing: CGFloat = 0.4, scaleRate: CGFloat = 0.7) {
        self.minAlpha = minAlpha
        self.itemSpacing = itemSpacing
        self.scaleRate = scaleRate
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        let width = collectionView.frame.width
        let transitionX = -(width * itemSpacing * position)
        let scaleFactor = scaleRate - 0.1 * abs(position)
        
        let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        let transitionTransform = CGAffineTransform(translationX: transitionX, y: 0)
        
        attributes.alpha = 1.0 - abs(position) + minAlpha
        attributes.transform = transitionTransform.concatenating(scaleTransform)
    }
}
