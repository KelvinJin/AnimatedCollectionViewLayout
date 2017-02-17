//
//  RotateInOutAttributesAnimator.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on 8/2/17.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import UIKit

/// An animator that rotating the cell in/out when you scroll.
/// - warning: You have to set `clipsToBounds` to `false` on the cell for this to
/// be effective. This might not be needed in the future release though.
public struct RotateInOutAttributesAnimator: LayoutAttributesAnimator {
    /// The alpha to apply on the cells that are away from the center. Should be 
    /// in range [0, 1]. 0 by default.
    public var minAlpha: CGFloat
    
    /// The max rotating angle that would be applied to the cell. Should be in
    /// range [0, 2pi]. PI/4 by default.
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
