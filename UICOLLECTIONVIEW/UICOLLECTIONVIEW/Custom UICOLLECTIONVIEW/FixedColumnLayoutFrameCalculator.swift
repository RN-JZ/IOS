


import UIKit
import Foundation

class FixedColoumnLayoutFrameCalulator
{
    // TO CALUCLAUT CELL ORIGIN WIDTH OF CELL AND HEIGTH OF EACH CELL WE NEED THESE PROPERTIES
    var columnSpacing: CGFloat = 5
    var rowSpacing: CGFloat = 5

    let referenceBounds: CGRect
    let numberOfColumns: Int
    let rowHeight: CGFloat

    init(referenceBounds: CGRect, numberOfColumns: Int, rowHeight: CGFloat) {
        self.referenceBounds = referenceBounds
        self.numberOfColumns = numberOfColumns
        self.rowHeight = rowHeight
    }
    
    public func rectForItem(at indexPath: IndexPath) -> CGRect {
        let origin = originForItemInSection(at: indexPath.item)
        let size = sizeForItem()  // size of cell and row
        return CGRect(origin: origin, size: size)
    }

    
    //to caluclate origin of cell
    private func originForItemInSection(at index: Int) -> CGPoint {
             //BEFORE CALCULATING ANY THING WE ALSO NEDD WIDTH OF CELL FIRST CALCULATE THAT
                                                        //ORIGIN X
             // AFTER THAT WE NEED INDEX BUT INDEX WILL BE 1 2 3 4 5 ---SOON SO TO KEEP XAXIS VALUE ALIGN OR ABOVE EACH OTHER
             // WE TKAE MODULE WHICH KEEP IT BETWEEN 1 TO NO OF COOLUMN
             // AFTER THAT MUTIPLY INDEX WITH WIDTH AND ADD IT WITH SPACING
                                                        // ORIGIN Y
        
            // NOW THE PROBLEM IS WHEN INDEX IN 4 IT WILL GIVE 1 AFTER MODULE WHICH WILL OVER LAP SO WE NEDD Y AXIS ALSO
           //  FOR Y AXIS IT SIMPLE FIND ROW ABOVE YOU AND MUTIPLE IT WITH ROW HEIGHT
          // TO FIND ABOVE ROW DIVIDE THE INDEX/ NUMBER OF COLOUMN  // AL LITTLE TRICkKY :)
        
            
            let column = CGFloat(index % numberOfColumns)
            let x =   column * sizeForItem().width + column * columnSpacing
            let y =   rowHeight  * CGFloat(index / numberOfColumns)
        
            return CGPoint(x: x, y: y)
        }
    
    private func ItemWidth() -> CGFloat
    {
        let coloum = CGFloat(self.numberOfColumns)
        let fullWidth = referenceBounds.width
                     // fullwidth - () AS THERE IS 3 COLOUMN AND 10 ROW SPAE SO WE DO COLOUMN-1 WHICH IS 3-1 = 2 SAME THINF THEN 2*5 = 10 SO NOW MAKE IT GENERIC
        let width =  fullWidth - (rowSpacing * (coloum - 1)) / 3
        return width
        
    }
    
    private func sizeForItem() -> CGSize {
        return CGSize(width: ItemWidth(), height: rowHeight - rowSpacing)
    }
        

}
