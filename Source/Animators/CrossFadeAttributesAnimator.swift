//
//  CrossFadeAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct CrossFadeAttributeAnimator: LayoutAttributesAnimator {
    public init() {}
    
    public func animate(collectionView: UICollectionView, attributes: PagerCollectionViewLayoutAttributes, position: CGFloat) {
        let contentOffset = collectionView.contentOffset
        attributes.frame = CGRect(origin: contentOffset, size: attributes.frame.size)
        attributes.alpha = 1 - abs(position)
    }
}
