//
//  NestedView.swift
//  AutoCode
//
//  Created by jahanzaib on 11/04/2023.
//

import UIKit

class NestedView: UIView {

    let redView:UIView = {
        let red = UIView()
        red.backgroundColor = .red
        
        return red
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("Canot initilize story board")
    }
    
//    override var intrinsicContentSize: CGSize
//    {
//        return CGSize(width: 200, height: 200)
//    }

}

extension NestedView
{
    
    func style()
    {
        backgroundColor = .green
        redView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(redView)
    }
    func layout()
    {
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: centerYAnchor),
            redView.heightAnchor.constraint(equalTo: heightAnchor , multiplier: 0.25),
            trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
           
            
           
        ])
    }
}
