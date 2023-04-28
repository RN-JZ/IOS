//
//  NestedViewController.swift
//  Safearea
//
//  Created by jahanzaib on 21/04/2023.
//

import UIKit

class NestedViewController: UIViewController {
    
    private let spacing: CGFloat = 50.0
    private let internalPadding: CGFloat = 25.0
    
    var nestedView:UIView =
    {
        let view = Nested()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        style()
        layout()

    }
    
  
    


}
extension NestedViewController
{
    func style()
    {
        view.addSubview(nestedView)
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: internalPadding, leading: internalPadding, bottom: internalPadding, trailing: internalPadding)
        
    }
    func layout()
    {
        
        
        let margin = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            nestedView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            nestedView.topAnchor.constraint(equalTo:  margin.topAnchor),
            margin.trailingAnchor.constraint(equalTo: nestedView.trailingAnchor),
            nestedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nestedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
                  
       ])
        
    }
}
