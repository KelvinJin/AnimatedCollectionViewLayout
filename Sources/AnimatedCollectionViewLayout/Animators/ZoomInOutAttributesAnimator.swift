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
    /// 1 means the cell will disappear at min. 0.2 by default.
    public var scaleRate: CGFloat
    
    public init(scaleRate: CGFloat = 0.2) {
        self.scaleRate = scaleRate
    }
    
    public func animate(collectionView: UICollectionView, attributes: AnimatedCollectionViewLayoutAttributes) {
        let position = attributes.middleOffset
        
        if position <= 0 && position > -1 {
            let scaleFactor = scaleRate * position + 1.0
            attributes.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        } else {
            attributes.transform = .identity
        }
    }
}
