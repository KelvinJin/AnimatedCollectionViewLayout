//
//  CubeAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

/// An animator that applies a cube transition effect when you scroll.
public struct CubeAttributesAnimator: LayoutAttributesAnimator {
    /// The perspective that will be applied to the cells. Must be negative. -1/500 by default.
    /// Recommended range [-1/2000, -1/200].
    public var perspective: CGFloat
    
    /// The higher the angle is, the _steeper_ the cell would be when transforming.
    public var totalAngle: CGFloat
    
    public init(perspective: CGFloat = -1 / 500, totalAngle: CGFloat = .pi / 2) {
        self.perspective = perspective
        self.totalAngle = totalAngle
    }
    
    public func animate(collectionView: UICollectionView, attributes: AnimatedCollectionViewLayoutAttributes) {
        let position = attributes.middleOffset
        
        guard let contentView = attributes.contentView else { return }
        
        if abs(position) >= 1 {
            contentView.layer.transform = CATransform3DIdentity
            contentView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        } else if attributes.scrollDirection == .horizontal {
            let rotateAngle = totalAngle * position
            let anchorPoint = CGPoint(x: position > 0 ? 0 : 1, y: 0.5)
            
            // As soon as we changed anchor point, we'll need to either update frame/position
            // or transform to offset the position change. frame doesn't work for iOS 14 any
            // more so we'll use transform.
            let anchorPointOffsetValue = contentView.layer.bounds.width / 2
            let anchorPointOffset = position > 0 ? -anchorPointOffsetValue : anchorPointOffsetValue
            
            var transform = CATransform3DMakeTranslation(anchorPointOffset, 0, 0)
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
            
            contentView.layer.transform = transform
            contentView.layer.anchorPoint = anchorPoint
        } else {
            let rotateAngle = totalAngle * position
            let anchorPoint = CGPoint(x: 0.5, y: position > 0 ? 0 : 1)
            
            // As soon as we changed anchor point, we'll need to either update frame/position
            // or transform to offset the position change. frame doesn't work for iOS 14 any
            // more so we'll use transform.
            let anchorPointOffsetValue = contentView.layer.bounds.height / 2
            let anchorPointOffset = position > 0 ? -anchorPointOffsetValue : anchorPointOffsetValue
            
            var transform = CATransform3DMakeTranslation(0, anchorPointOffset, 0)
            transform.m34 = perspective
            transform = CATransform3DRotate(transform, rotateAngle, -1, 0, 0)
            
            contentView.layer.transform = transform
            contentView.layer.anchorPoint = anchorPoint
        }
    }
}
