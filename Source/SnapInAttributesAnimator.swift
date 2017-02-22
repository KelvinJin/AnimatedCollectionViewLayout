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
                attributes.transform = CGAffineTransform(translationX: translationX, y: 0)
            } else {
                let translationY = (1 - pow(abs(position), 3.0)) * attributes.frame.height / 4
                attributes.transform = CGAffineTransform(translationX: 0, y: translationY)
            }
            attributes.alpha = 1.0 * abs(position)
        } else {
            attributes.alpha = 1.0
            attributes.transform = .identity
        }
    }
}
