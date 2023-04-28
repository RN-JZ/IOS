//
//  MainViewController.swift
//  Bankey
//
//  Created by jahanzaib on 28/04/2023.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTabBar()

    }
    

}

extension MainViewController
{
    func setupViews()
    {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVc = MoreViewController()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVc.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNc =  UINavigationController(rootViewController: moreVc)
        
        
       
        
        hideNavigationBar(summaryNC.navigationBar)
        hideNavigationBar(moreNc.navigationBar)
        hideNavigationBar(moneyNC.navigationBar)
       
        
        setViewControllers([summaryNC , moneyNC , moreNc], animated: true)
        
        
    }
    
    private func hideNavigationBar(_ navigationBar: UINavigationBar) {
            let img = UIImage()
            navigationBar.shadowImage = img
            navigationBar.setBackgroundImage(img, for: .default)
            navigationBar.isTranslucent = false
        }
    
    private func setupTabBar()
    {
        tabBar.tintColor = .systemTeal
        tabBar.isTranslucent = false
    }
    
}



class AccountSummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red


    }
    

}

class MoveMoneyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        

    }
    

}


class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        

    }
    

}
