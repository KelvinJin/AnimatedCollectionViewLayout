//
//  TurnAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct TurnAttributeAnimator: LayoutAttributesAnimator {
    public var perspective: CGFloat
    
    public init(perspective: CGFloat = -1 / 1000) {
        self.perspective = perspective
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        if abs(position) >= 1 {
            attributes.contentView?.layer.transform = CATransform3DIdentity
        } else {
            let rotateAngle = CGFloat(M_PI_2) * min(position, 0)
            var transform = CATransform3DIdentity
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
            
            let contentOffset = collectionView.contentOffset
            let itemOrigin = attributes.frame.origin
            transform = CATransform3DTranslate(transform, contentOffset.x - itemOrigin.x, 0, 0)
            transform = CATransform3DScale(transform, 1.0, 0.8, 1)
            
            attributes.contentView?.layer.transform = transform
            attributes.contentView?.keepCenterAndApplyAnchorPoint(CGPoint(x: 0, y: 0.5))
            attributes.alpha = 1 - abs(position)
        }
    }
}
