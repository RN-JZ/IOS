//
//  Challenge1ViewController.swift
//  AutoCode
//
//  Created by jahanzaib on 11/04/2023.
//

import UIKit

class Challenge1ViewController: UIViewController {
    
    var nestedView = NestedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(nestedView)
        
        
        nestedView.translatesAutoresizingMaskIntoConstraints = false
        
    
        
        NSLayoutConstraint.activate([
                   nestedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                   nestedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                   nestedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                   nestedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
               ])

        // Do any additional setup after loading the view.
    }
    

  

}
