//
//  PageAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct PageAttributeAnimator: LayoutAttributesAnimator {
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        let contentOffset = collectionView.contentOffset
        let itemOrigin = attributes.frame.origin
        let scaleFactor = scaleRate * min(position, 0) + 1.0
        var transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        transform = transform.concatenating(CGAffineTransform(translationX: position < 0 ? contentOffset.x - itemOrigin.x : 0, y: 0))
        attributes.transform = transform
        attributes.zIndex = attributes.indexPath.row
    }
}
