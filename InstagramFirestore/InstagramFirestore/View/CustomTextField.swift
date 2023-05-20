
import Foundation
import UIKit
class CustomTextField:UITextField
{
    
        init(placeHolder:String) {
        super.init(frame: .zero)
        
        
        borderStyle = .none
        attributedPlaceholder = NSAttributedString(string:placeHolder, attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])
        
        // add image icon on left and right
        // AS IMAGE IS ALSO inherit from UIVIEW so we can also pass uiview
        let data = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        leftView  = data
        leftViewMode = .always
        
        
        textColor = .white
        setHeight(50)
        backgroundColor = UIColor(white: 1, alpha: 0.1)
    }
    required init?(coder: NSCoder) {
        fatalError("Something wrong happen here")
    }
}
