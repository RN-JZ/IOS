//
//  ViewController.swift
//  Safearea
//
//  Created by jahanzaib on 20/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let redView:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let margin: CGFloat = 25.0
    let nestedView: NestedView = {
        let view = NestedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    private func changeNestedMargins(inset: CGFloat)
    {
       
        if #available(iOS 11, *)
        {
        nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        }
        else {
          nestedView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
      }
    }



}

extension ViewController
{
    func style()
    {
//        view.addSubview(redView)
//        redView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.addSubview(nestedView)
        //changeNestedMargins(inset: margin)
        
    }
   
    func layout()
    {
       
//        NSLayoutConstraint.activate([
//                redView.leadingAnchor.constraint(equalTo:
//                safeLeadingAnchor, constant: 25),
//                safeTrailingAnchor.constraint(equalTo:
//                redView.trailingAnchor, constant: 25),
//                redView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 25),
//                safeBottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 25)
//
//                ])
        
        
        
        //Nested View
        
        NSLayoutConstraint.activate([
               nestedView.topAnchor.constraint(equalTo:
             safeTopAnchor),
               nestedView.bottomAnchor.constraint(equalTo:
             safeBottomAnchor),
               nestedView.leadingAnchor.constraint(equalTo:
             view.layoutMarginsGuide.leadingAnchor),
               nestedView.trailingAnchor.constraint(equalTo:
             view.layoutMarginsGuide.trailingAnchor)
               ])
        
        
        
       
    }
}




