//
//  ViewController.swift
//  Bankey
//
//  Created by jahanzaib on 09/04/2023.
//

import UIKit

protocol LoginViewControllerDelegate:class
{
    func didLogin()
}


class LoginViewController: UIViewController {
    let bankey = UILabel()
    let discription = UILabel()
    let login = LoginView()
    let signButton = UIButton(type: .system)
    let errorMessage = UILabel()
    weak var delegate:LoginViewControllerDelegate? // what is weak var
    var userName:String?
    {
        return login.userNameTextField.text
    }
    var password:String?
    {
        return login.passwordTextField.text
    }
    
    private lazy var rootstackView:UIStackView =
    {
        let stack = UIStackView(arrangedSubviews: [bankey , discription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 2
        
        return stack
       
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension LoginViewController
{
    func style()
    {
        
        bankey.text = "Bankey"
        bankey.numberOfLines = 0
        bankey.textColor = .black
        bankey.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        bankey.adjustsFontForContentSizeCategory = true
        bankey.textAlignment = .center
       
        
        
        discription.text = "Your'premium source of all things banking"
        discription.font = UIFont.preferredFont(forTextStyle: .title3)
        discription.textAlignment = .center
        discription.numberOfLines = 0
        discription.adjustsFontForContentSizeCategory = true
       
        
        
        
        login.translatesAutoresizingMaskIntoConstraints = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        
        
        signButton.setTitle("Sign In", for: .normal)
        signButton.configuration = .filled()
        signButton.configuration?.imagePadding = 20
        signButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        // check out article on button
        // Button configuration in ios 15
        
        errorMessage.textAlignment = .center
        errorMessage.textColor = .systemRed
        errorMessage.numberOfLines = 0
        errorMessage.text = "Error Messaage"
        errorMessage.isHidden = true
    }
    func layout()
    {
      
        
        view.addSubview(login)
        view.addSubview(signButton)
        view.addSubview(errorMessage)
        view.addSubview(rootstackView)
        //Login view
        NSLayoutConstraint.activate([
            
            login.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            login.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: login.trailingAnchor, multiplier: 1)
        ])
        // Button
        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalToSystemSpacingBelow: login.bottomAnchor, multiplier:2),
            signButton.leadingAnchor.constraint(equalTo: login.leadingAnchor),
            signButton.trailingAnchor.constraint(equalTo: login.trailingAnchor)
            
        ])
        
        // ERROR
        NSLayoutConstraint.activate([
            errorMessage.topAnchor.constraint(equalToSystemSpacingBelow: signButton.bottomAnchor, multiplier:2),
            errorMessage.leadingAnchor.constraint(equalTo: login.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: login.trailingAnchor)
            
        ])
        
        // LABEL
        NSLayoutConstraint.activate([
            rootstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootstackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rootstackView.trailingAnchor, multiplier: 5),
            login.topAnchor.constraint(equalToSystemSpacingBelow: rootstackView.bottomAnchor, multiplier: 5)
            
        ])
        
    }
}


// MARK:- Action
extension LoginViewController
{
    @objc func signInTapped(sender:UIButton)
    {
        errorMessage.isHidden = true
        Login()
        
    }
    
    private func Login()
    {
        guard let user = userName , let pass = password else {
            assertionFailure("UserName/ Password should not be nil")
            return
        }
        if user.isEmpty || pass.isEmpty
        {
            configurationView(withMessage: "UserName/ Password should not be nil")
        }
        else if user == "jz" && password == "abc"
        {
            signButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
        else
        {
            configurationView(withMessage: "UserName/ Password is Incorrect")
        }
        
    }
    
    private func configurationView(withMessage message:String)
    {errorMessage.text = message
        errorMessage.isHidden = false
        
    }
}

