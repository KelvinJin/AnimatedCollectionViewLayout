//
//  AnimatedCollectionViewLayout.swift
//  AnimatedCollectionViewLayout
//
//  Created by Jin Wang on Feb 8, 2017.
//  Copyright © 2017 Uthoft. All rights reserved.
//

import Foundation
import UIKit

/// A `UICollectionViewFlowLayout` subclass enables custom transitions between cells.
public class AnimatedCollectionViewLayout: UICollectionViewFlowLayout {
    
    /// The animator that would actually handle the transitions.
    public var animator: LayoutAttributesAnimator?
    
    /// Overrided so that we can store extra information in the layout attributes.
    public override class var layoutAttributesClass: AnyClass { return PagerCollectionViewLayoutAttributes.self }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        return attributes.flatMap { $0.copy() as? UICollectionViewLayoutAttributes }.map { self.transformLayoutAttributes($0) }
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // We have to return true here so that the layout attributes would be recalculated
        // everytime we scroll the collection view.
        return true
    }
    
    private func transformLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        guard let collectionView = self.collectionView,
            let a = attributes as? PagerCollectionViewLayoutAttributes else { return attributes }
        
        // The position for each cell is defined as the ratio of the distance between 
        // the center of the cell and the center of the screen and the screen width.
        // It can be negative if the cell is, for instance, on the left of the screen.
        
        let width = collectionView.frame.width
        let centerX = width / 2
        let offset = collectionView.contentOffset.x
        let itemX = a.center.x - offset
        let position = (itemX - centerX) / width
        
        // Cache the contentView since we're going to use it a lot.
        if a.contentView == nil {
            a.contentView = collectionView.cellForItem(at: attributes.indexPath)?.contentView
        }
        
        animator?.animate(collectionView: collectionView, attributes: a, position: position)
        
        return a
    }
}

/// A custom layout attributes that contains extra information.
public class PagerCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    public var contentView: UIView?
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! PagerCollectionViewLayoutAttributes
        copy.contentView = contentView
        return copy
    }
}
