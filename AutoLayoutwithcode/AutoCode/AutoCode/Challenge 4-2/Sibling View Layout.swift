//
//  Sibling View Layout.swift
//  AutoCode
//
//  Created by jahanzaib on 11/04/2023.
//

import UIKit

class Sibling_View_Layout: UIViewController {
    
    let redView:UIView = {
        let red = UIView()
        red.backgroundColor = .red
        
        return red
    }()
    
    let greenView:UIView = {
        let green = UIView()
        green.backgroundColor = .green
        
        return green
    }()
    
    let blueView:UIView = {
        let blue = UIView()
        blue.backgroundColor = .blue
        
        return blue
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
         style()
         layout()
        
        // Do any additional setup after loading the view.
    }
    


}

extension Sibling_View_Layout
{
    
    func style()
    {
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
    }
    func layout()
    {
        NSLayoutConstraint.activate([
                    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                    redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                    redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),

                    greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                    greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 25),

                    blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                    blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                    blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 25),
                    blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),

                    greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),
                    blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
                ])
        
     
    }
}

