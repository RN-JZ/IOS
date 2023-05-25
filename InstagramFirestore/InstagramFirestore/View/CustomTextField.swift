
import Foundation
import UIKit





// in NSMAPTABLE firt one in key and second one is value
private var errorViews = NSMapTable<UITextField,UIView>(keyOptions: NSPointerFunctions.Options.weakMemory, valueOptions: NSPointerFunctions.Options.strongMemory)
class CustomTextField:UITextField
{
        
        let container =  UIView()
        let line = UIView()
        let lable = UILabel()
        let errorButton = UIButton(type: .custom)
        
        
    
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
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("Something wrong happen here")
    }
    
    
    func setError(value:String , field:UITextField)
    {
        lable.text = value
        errorButton.isHidden = false
    }
}

extension CustomTextField
{
    func style()
    {
        
        
        
        container.translatesAutoresizingMaskIntoConstraints = false
//        let window = UIApplication.shared.keyWindow?.addSubview(container)
        self.addSubview(container)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .red
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "some thing some thing some thing"
        lable.textColor = .white
        lable.numberOfLines = 0
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.backgroundColor = .blue
        
        
        // ERROR BUTTON
        errorButton.translatesAutoresizingMaskIntoConstraints = false
        errorButton.tag = 999
        errorButton.setImage(UIImage(named: "ic-error"), for: .normal)
        rightView = errorButton
        rightViewMode = .always
        errorButton.addTarget(self, action: #selector(errorAction), for: .touchUpInside)
        
        
        
        
        
        container.addSubview(line)
        container.addSubview(lable)
        
        
        errorViews.setObject(container, forKey: self)
        
        let enumerator = errorViews.objectEnumerator()
                while let view = enumerator!.nextObject() as! UIView? {
                    view.isHidden = true
                    errorButton.isHidden = true
                }
      
        
        
    }
    func layout()
    {
        // Set constraints for line
                line.heightAnchor.constraint(equalToConstant: 3).isActive = true
                line.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
                line.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
                line.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true
        
        // Set constraints for label
               lable.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
               lable.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
               lable.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
               lable.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true
        
        
        
        // Set constraints for container
        container.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        container.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc func errorAction(_ sender:Any)
    {
            print("foo-Click the error")
            container.isHidden.toggle()
    }
    
}
