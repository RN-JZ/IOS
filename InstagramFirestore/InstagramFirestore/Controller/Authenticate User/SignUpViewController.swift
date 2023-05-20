


import UIKit


class SignUPViewcontroller:UIViewController {
    
    var stack:UIStackView = UIStackView()
    let gradient = CAGradientLayer()
    private var viewModel = Authentication()
  
 
    private let backView:UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        return view
    }()
    private let iconImageButton:UIButton =
    {
        let LB = UIButton(type: .system)
        var image = UIImage(named: "plus_photo")
        LB.setImage(image, for: .normal)
        LB.tintColor = .white
        LB.addTarget(self, action: #selector(SelectImage), for: .touchUpInside)
        return LB
    }()
    
    private let emailField:UITextField =
    {
        var field = CustomTextField(placeHolder: "Email")
        field.keyboardType = .emailAddress
        field.keyboardAppearance = .dark
        return field
    }()
    private let passwordField:UITextField =
    {
        var field = CustomTextField(placeHolder: "passowrd")
        field.isSecureTextEntry = true
       
        return field
    }()
    private let FullName:UITextField =
    {
        var field = CustomTextField(placeHolder: "Full Name")
       
        return field
    }()
    private let UserName:UITextField =
    {
        var field = CustomTextField(placeHolder: "UserName")
       
        return field
    }()
    private let SignUpButton:UIButton =
    {
        let LB = UIButton(type: .system)
        LB.setTitle("Sign UP ", for: .normal)
        LB.setTitleColor(.white, for: .normal)
        LB.layer.cornerRadius = 5
        LB.setHeight(50)
        LB.backgroundColor = .purple.withAlphaComponent(0.5)
        LB.isEnabled = false
        
       
        LB.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return LB
        
    }()
    
    private let HaveAccount:UIButton={
        
        let LB = UIButton(type: .system)
        LB.attributedTitle(firstPart: "Already Have account? ", secondPart: "Sign In")
        LB.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return LB
        
    }()
    
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
        print("IN VIEW APPERAR")
        print(view.frame)
        gradient.frame = view.frame
    }
    
    
    // MARK: - ACTION
    
    @objc func SelectImage()
    {
        print("foo - I am in")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleShowSignIn()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender:UITextField)
    {
        if sender == emailField
        {
            print("foo - in email")
            viewModel.email = sender.text
           
        }
        if sender == UserName
        {
            print("foo - in userName")
            viewModel.userName = sender.text
        }
        if sender == FullName
        {
            print("foo - in FullName")
            viewModel.FullName = sender.text
        }
        else{
            print("foo - in Password")
            viewModel.password = sender.text
        }
        
        if viewModel.isValid
        {
            SignUpButton.isEnabled = true
            SignUpButton.backgroundColor = .blue
        }
    }
    
    
}

extension SignUPViewcontroller
{
    
    func style()
    {
        view.addSubview(backView)
         backView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(iconImageButton)
        iconImageButton.translatesAutoresizingMaskIntoConstraints = false
        

        stack = UIStackView(arrangedSubviews: [emailField , passwordField ,FullName,UserName, SignUpButton ])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false


        view.addSubview(HaveAccount)
        HaveAccount.translatesAutoresizingMaskIntoConstraints = false
        
      
        
        
        
    }
    func layout()
    {
        backView.centerX(inView: view)
        backView.setDimensions(height: 127, width: 127)
        backView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop:29)
        
        
        
        // MARK: - LOGO CONSTRAINT
            
        iconImageButton.centerX(inView: view)
        iconImageButton.setDimensions(height: 120, width: 120)
        iconImageButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop:32)
        

        // MARK: - Field CONSTRAINT

        stack.anchor(top: iconImageButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        
        // MARK: - HAVE ACCOUNT CONSTRIANT
        HaveAccount.centerX(inView: view)
        HaveAccount.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)

        
        
        
       
        
        
    }
}

// MARK: - Delegate functions

extension SignUPViewcontroller:UIImagePickerControllerDelegate , UINavigationControllerDelegate
{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            print("foo- in delegate")
           // Handle the selected image here
           guard let image = info[.editedImage] as? UIImage else{
               print("foo- FOUND NIL")
               return
           }
        
            let originalImage = image.withRenderingMode(.alwaysOriginal)
            iconImageButton.layer.cornerRadius = iconImageButton.frame.size.width / 2
            iconImageButton.layer.masksToBounds = true
            iconImageButton.setImage(originalImage, for: .normal)
            
           backView.layer.cornerRadius = backView.frame.width/2
           backView.clipsToBounds = true
           backView.isHidden = false
       
           picker.dismiss(animated: true, completion: nil)
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           print("foo- in Cancle")
           picker.dismiss(animated: true, completion: nil)
       }
    
    func ConfigureNotificationObserver()
    {
        emailField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        passwordField.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        FullName.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
        UserName.addTarget(self, action:#selector(textDidChange), for: .editingChanged)
    }
    
}




