//
//  AnimatedCollectionViewLayout.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on Feb 8, 2017.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import Foundation
import UIKit

public class AnimatedCollectionViewLayout: UICollectionViewFlowLayout {
    
    public var animator: LayoutAttributesAnimator?
    
    public override class var layoutAttributesClass: AnyClass { return PagerCollectionViewLayoutAttributes.self }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        return attributes.flatMap { $0.copy() as? UICollectionViewLayoutAttributes }.map { self.transformLayoutAttributes($0) }
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    private func transformLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        guard let collectionView = self.collectionView else { return attributes }
        
        guard let a = attributes as? PagerCollectionViewLayoutAttributes else { return attributes }
        
        let width = collectionView.frame.width
        let centerX = width / 2
        let offset = collectionView.contentOffset.x
        let itemX = a.center.x - offset
        let position = (itemX - centerX) / width
        
        // Store the contentView if
        if a.contentView == nil {
            a.contentView = collectionView.cellForItem(at: attributes.indexPath)?.contentView
        }
        
        animator?.animate(collectionView: collectionView, attributes: a, position: position)
        
        return a
    }
}

public class PagerCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    public var contentView: UIView?
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! PagerCollectionViewLayoutAttributes
        copy.contentView = contentView
        return copy
    }
}
