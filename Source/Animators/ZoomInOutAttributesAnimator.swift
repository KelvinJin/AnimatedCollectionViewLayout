//
//  ZoomInOutAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct ZoomInOutAttributesAnimator: LayoutAttributesAnimator {
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        if abs(position) >= 1 {
            attributes.contentView?.transform = .identity
        } else {
            let scaleFactor = scaleRate * position + 1.0
            attributes.contentView?.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    }
}
