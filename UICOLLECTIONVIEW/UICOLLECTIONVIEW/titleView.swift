//
//  titleView.swift
//  UICOLLECTIONVIEW
//
//  Created by jahanzaib on 16/06/2023.
//

import UIKit

class TitleView:UICollectionViewCell
{
    static var identifier: String = "TitleCell"
    
   
    var label: UILabel =
    {
        let label = UILabel()
        label.text = "SECTION A"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    override init(frame: CGRect) {
   super.init(frame: frame)
        setup()
        layout()
   }
   // This function is required for a custom UIView.
       required init?(coder aDecoder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
       }
   
}

extension TitleView
{
    
    func setup()
    {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout()
    {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])

    }
}
