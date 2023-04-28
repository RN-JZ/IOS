//
//  NestedView.swift
//  Safearea
//
//  Created by jahanzaib on 21/04/2023.
//

import Foundation
import UIKit

class NestedView:UIView
{
    private lazy var nestedView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .green
        return view }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        style()
        layout()
           
    }
    
    
}

extension NestedView
{
    func style()
    {
        nestedView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nestedView)
    }
    func layout()
    {
        NSLayoutConstraint.activate([
            
                  nestedView.leadingAnchor.constraint(equalTo:
              layoutMarginsGuide.leadingAnchor),
                  nestedView.topAnchor.constraint(equalTo:
              layoutMarginsGuide.topAnchor),
                  nestedView.trailingAnchor.constraint(equalTo:
              layoutMarginsGuide.trailingAnchor),
                  
                  nestedView.bottomAnchor.constraint(equalTo:
             layoutMarginsGuide.bottomAnchor)
       ])
        
    }
    
}
