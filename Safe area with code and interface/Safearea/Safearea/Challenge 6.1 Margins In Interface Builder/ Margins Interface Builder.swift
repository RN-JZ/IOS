//
//   Margins Interface Builder.swift
//  Safearea
//
//  Created by jahanzaib on 21/04/2023.
//

import Foundation
import UIKit
class Nested:UIView
{
    var bluewView:UIView =
    {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var redView:UIView =
    {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    // THIS IS FOR INTERFACE BUILDER
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension Nested
{
    func style()
    {
        addSubview(redView)
        addSubview(bluewView)
        
    }
    func layout()
    {
        NSLayoutConstraint.activate([
            bluewView.leadingAnchor.constraint(equalTo:layoutMarginsGuide.leadingAnchor),
            bluewView.topAnchor.constraint(equalTo:layoutMarginsGuide.topAnchor),
            bluewView.bottomAnchor.constraint(equalTo:layoutMarginsGuide.bottomAnchor),
            
            bluewView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            
            bluewView.trailingAnchor.constraint(equalTo: redView.leadingAnchor , constant: -20),
            
            redView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            redView.topAnchor.constraint(equalTo:layoutMarginsGuide.topAnchor),
            redView.bottomAnchor.constraint(equalTo:layoutMarginsGuide.bottomAnchor),
           
        ])
    }
}
