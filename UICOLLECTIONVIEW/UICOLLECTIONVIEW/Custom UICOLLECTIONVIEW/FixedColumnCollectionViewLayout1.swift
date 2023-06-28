

import UIKit
import Foundation


class FixedColumnCollectionViewLayout1: UICollectionViewFlowLayout
{
    var frameCalculator: FixedColoumnLayoutFrameCalulator?
    let numberOfColumns: Int
    let rowHeight: CGFloat

    private var cellLayoutAttributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]

    init(numberOfColumns: Int, rowHeight: CGFloat) {
        self.numberOfColumns = numberOfColumns
        self.rowHeight = rowHeight

        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func invalidateLayout() {
        if let bounds = collectionView?.bounds {
            frameCalculator = FixedColoumnLayoutFrameCalulator(referenceBounds: bounds,
                                                               numberOfColumns: numberOfColumns,
                                                               rowHeight: rowHeight)
        }
        cellLayoutAttributes = [:]

        super.invalidateLayout()
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        let sections = [Int](0...collectionView.numberOfSections - 1)
        
        for section in sections {
            let itemCount = collectionView.numberOfItems(inSection: section)
            let indexPaths = [Int](0...itemCount - 1).map { IndexPath(item: $0, section: section) }
            indexPaths.forEach { indexPath in
                cellLayoutAttributes[indexPath] = layoutAttributesForItem(at: indexPath)
            }
        }
    }
    
    
//    override func layoutAttributesForItem(at indexPath: IndexPath) ->UICollectionViewLayoutAttributes? {
//        if cellLayoutAttributes[indexPath] != nil {
//            return cellLayoutAttributes[indexPath]
//        }
//    }
        
}
