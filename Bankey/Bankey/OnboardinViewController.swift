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
    var text = String()
    var image = String()
    private lazy var stackView:UIStackView =
    {
        let stack = UIStackView(arrangedSubviews: [imageView , label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    
    init(heroImageName:String , titleText:String)
    {
        self.text = titleText
        self.image = heroImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        imageView.image  = UIImage(named: image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.text = text
        
        
        
        
    }
    func layout()
    {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            
            
        ])


    }
}
