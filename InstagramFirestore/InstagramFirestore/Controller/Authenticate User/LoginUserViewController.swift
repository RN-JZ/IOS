


import UIKit

protocol AutheticationDelegate:class
{
    func authenticationComplete()
}


class LoginUserViewController:UIViewController {
    
    var stack:UIStackView = UIStackView()
    private var viewModel = loginViewModel()
    let gradient = CAGradientLayer()
    weak var delegate:AutheticationDelegate?
    
    private let iconImage:UIImageView =
    {
        var insta = UIImageView(image: UIImage(named: "Instagram_logo_white")!)
        insta.contentMode = .scaleAspectFill
        return insta
    }()
    
    
    private let emailField:UITextField =
    {
        var field = CustomTextField(placeHolder: "Email")
        field.keyboardType = .emailAddress
        field.keyboardAppearance = .default
        field.keyboardAppearance = .dark
       
        return field
    }()
    
    private let passwordField:UITextField =
    {
        var field = CustomTextField(placeHolder: "passowrd")
        field.isSecureTextEntry = true
        field.addTarget(self, action:#selector(textDidChange), for: .touchUpInside)
       
        return field
    }()
    
    private let loginButton:UIButton =
    {
        let LB = UIButton(type: .system)
        LB.setTitle("Log in ", for: .normal)
        LB.setTitleColor(.white, for: .normal)
        LB.backgroundColor = .purple.withAlphaComponent(0.5)
        LB.layer.cornerRadius = 5
        LB.setHeight(50)
        LB.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        LB.isEnabled = false
        LB.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return LB
        
    }()
    
    private let donotHaveAccount:UIButton={
        
        let LB = UIButton(type: .system)
        LB.attributedTitle(firstPart: "Don't Have account? ", secondPart: "Sign Up")
        LB.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return LB
        
    }()
    
    private let forgetButton:UIButton={
        
        let LB = UIButton(type: .system)
        LB.attributedTitle(firstPart: "Forget you password? ", secondPart: "Get help signing in")
        return LB
        
    }()
    
    //MARK: - ACTION
    @objc func handleLogin()
    {
        
        AuthService.logUserIn(withEmail: emailField.text!, password: passwordField.text!) {(result , error) in
            if let error = error {
                print("Failed to login : \(error.localizedDescription)")
            } else {
                print("User Login successfully.")
                // Handle successful registration here
                self.delegate?.authenticationComplete()
                self.dismiss(animated: true, completion: nil)
                
              
            }
        }
    }
    
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        gradient.colors = [UIColor.systemPurple.cgColor , UIColor.systemBlue.cgColor]
        view.layer.addSublayer(gradient)
        gradient.locations = [0 , 0.4]
        gradient.frame = view.frame
        style()
        layout()
        ConfigureNotificationObserver()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("IN VIEW APPEAR")
        print(view.frame)
        gradient.frame = view.frame
    }
    
    // MARK: - ACTION
    
    @objc func handleShowSignUp()
    {
        let controller = SignUPViewcontroller()
        controller.delegate = delegate
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender:UITextField)
    {
        if sender == emailField
        {
            viewModel.email = sender.text
           
        }
        else{
            viewModel.password = sender.text
        }
        
        if viewModel.isValid
        {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .blue
        }
    }

    
    
}

extension LoginUserViewController
{
    
    func style()
    {
        
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
    
        stack = UIStackView(arrangedSubviews: [emailField , passwordField , loginButton , forgetButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(donotHaveAccount)
        donotHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    func layout()
    {
        
        
        // MARK: - LOGO CONSTRAINT
            
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop:32)
        
        
        // MARK: - Field COnstraint
        
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        
        // MARK: - DONOT HAVE ACCOUNT CONSTRIANT
        donotHaveAccount.centerX(inView: view)
        donotHaveAccount.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
        
       
        
        
    }
    func ConfigureNotificationObserver()
    {
        emailField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        passwordField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
    }
}



