//
//  ViewController.swift
//  UI TAB BAR
//
//  Created by jahanzaib on 28/04/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // we need to call this is view Did Appear beacuse otherwise the view will not be availabe yet to show any thing
        Tabbar()
    }


}

extension ViewController
{
    
    func Tabbar()
    {
        let tabBarController = UITabBarController()
        
        let vc1 = SearchViewController()
        let vc2 = ContentViewController()
        let vc3 = FavouriteViewController()
        
        
        vc1.title = "Search"
        vc2.title = "Content"
        vc3.title = "Favourite"
        
        
        // when we use below method uitabbaritem it automaticall do this and add nanem but when we do manually the problem occuur the obejct is not called untile we click on it
        // so that why we have to do it here so it so on screen when app launches
        
        
        
        // this will default image with name
//        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
//        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        
    
        
        
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        
       
        
        
       //tabBarController.viewControllers = [vc1 , vc2 , vc3]  // EITHER WAY WORKS FINE
        
       tabBarController.setViewControllers([nc1 , nc2 , nc3], animated: true)
       tabBarController.tabBar.backgroundColor = .systemGray
       var value = tabBarController.selectedIndex
       
        
        
        
        // we can also set images like this but call it when we add vc in set view controller
        // we loop on array of item in tabbar item which in vc  and set it there
        // first we check tabbar not empty
        
        guard let item = tabBarController.tabBar.items else {
            print("foo - i am in ")
            return}
        
        // now iten containt [UI TAB BAR ITEM]
        // which is nothing but tabbaritem
        // vc1.tabBarItem.image = UIImage(systemName: "house")
        // if you see about code the vc calling tabbaritem and then image to set image but can dirsctky call it
        let image = ["house" , "bell" , "star"]
        for itr in 0..<item.count
        {
            
            item[itr].image = UIImage(systemName: image[itr])
            
        }
        
       
       

        
        
        
        //IMP
        
        //  When presenting the UITabBarController modally using the present(_:animated:completion:) method, the view controller hierarchy is managed by the system automatically. Therefore, you do not need to add the tab bar controller's view as a subview of the current view controller's view.
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
        
        
        // the above line add it automatically
//        addChild(tabBarController)
//        view.addSubview(tabBarController.view)
//        tabBarController.didMove(toParent: self)
        
    }
}





class SearchViewController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        title = "Search"
    }
}

class ContentViewController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .blue
        title = "Content"
        // Do any additional setup after loading the view.
    }
}


class FavouriteViewController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Favourite"
        // Do any additional setup after loading the view.
    }
}
