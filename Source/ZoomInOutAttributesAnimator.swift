//
//  ZoomInOutAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

/// An animator that zoom in/out cells when you scroll.
public struct ZoomInOutAttributesAnimator: LayoutAttributesAnimator {
    /// The scaleRate decides the maximum scale rate where 0 means no scale and
    /// 1 means the size will be double at max and disappearing at min.
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes) {
        let position = attributes.middleOffset
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
        } else {
            let scaleFactor = scaleRate * position + 1.0
            attributes.contentView?.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    }
}
