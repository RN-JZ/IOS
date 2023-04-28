//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by jahanzaib on 28/04/2023.
//

import UIKit


extension UIViewController
{
    func setTabBarImage(imageName:String , title:String)
    {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: config)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}
