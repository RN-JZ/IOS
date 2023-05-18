


import UIKit

class LoginUserViewController:UIViewController {
    
    
    let textField:UITextField =
    {
        var field = UITextField()
        field.placeholder = "Email"
        field.backgroundColor = UIColor.lightGray
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor , UIColor.systemBlue.cgColor]
        view.layer.addSublayer(gradient)
        gradient.locations = [0 , 0.4]
        gradient.frame = view.frame
        
        style()
        layout()
        
    }
    
}

extension LoginUserViewController
{
    
    func style()
    {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout()
    {
        
    }
}
