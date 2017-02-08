//
//  RotateInOutAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

// ClipsToBounds = false
public struct RotateInOutAttributesAnimator: LayoutAttributesAnimator {
    public var minAlpha: CGFloat
    public var maxRotate: CGFloat
    
    public init(minAlpha: CGFloat = 0, maxRotate: CGFloat = CGFloat(M_PI_4)) {
        self.minAlpha = minAlpha
        self.maxRotate = maxRotate
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
            attributes.alpha = 1.0
        } else {
            let rotateFactor = maxRotate * position
            attributes.zIndex = attributes.indexPath.row
            attributes.alpha = 1.0 - abs(position) + minAlpha
            attributes.contentView?.transform = CGAffineTransform(rotationAngle: rotateFactor)
        }
    }
}
