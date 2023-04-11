//
//  OnboardinViewController.swift
//  Bankey
//
//  Created by jahanzaib on 11/04/2023.
//

import Foundation
import UIKit


class OnboardinViewController:UIViewController
{
    
   
    let label = UILabel()
    let imageView = UIImageView()
    private lazy var stackView:UIStackView =
    {
        let stack = UIStackView(arrangedSubviews: [imageView , label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    
    override func viewDidLoad() {
        style()
        layout()
        
    }
}

extension OnboardinViewController
{
    func style()
    {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image  = UIImage(named: "delorean")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.text = "Bankey is faster to use and has a brans new look and feel taht will make you fell like you are in 1989"
        
        
        
        
    }
    func layout()
    {
        
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            
            
        ])


    }
}
