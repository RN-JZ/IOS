

import Foundation
import UIKit


class InputTextView:UITextView
{
    var PlaceHolderText:String?
    {
        didSet
        {
            placeHolderlabel.text = PlaceHolderText
        }
    }
    private var placeHolderlabel:UILabel =
    {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        style()
        layout()
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChnage), name:UITextView.textDidChangeNotification , object: nil)
       
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("Init(code:) has not been implemented")
    }
    
    func style()
    {
        placeHolderlabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeHolderlabel)
    }
    func layout()
    {
        placeHolderlabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
        
    }
    
    @objc func handleTextDidChnage()
    {
        placeHolderlabel.isHidden = !text.isEmpty
    }
}


