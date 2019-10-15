//
//  FadeInAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 22/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

public struct SnapInAttributesAnimator: LayoutAttributesAnimator {
    
    public init() {}
    
    public func animate(collectionView: UICollectionView, attributes: AnimatedCollectionViewLayoutAttributes) {
        let position = attributes.endOffset
        
        if position < 0 && position > -1 {
            if attributes.scrollDirection == .horizontal {
                let translationX = (1 - pow(abs(position), 3.0)) * attributes.frame.width / 4
                let translationTransform = CGAffineTransform(translationX: translationX, y: 0)
                let scaleFactor = 0.8 - position * 0.2
                attributes.transform = translationTransform.concatenating(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
            } else {
                let translationY = (1 - pow(abs(position), 3.0)) * attributes.frame.height / 4
                let translationTransform = CGAffineTransform(translationX: 0, y: translationY)
                let scaleFactor = 0.8 - position * 0.2
                attributes.transform = translationTransform.concatenating(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
            }
            attributes.alpha = 1.0 * abs(position)
        } else {
            attributes.alpha = 1.0
            attributes.transform = .identity
        }
    }
}
