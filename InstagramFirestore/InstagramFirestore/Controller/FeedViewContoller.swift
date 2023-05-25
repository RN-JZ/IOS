
import UIKit

class FeedViewController:UITabBarController
{


    override func viewDidLoad() {
        super.viewDidLoad()

        style()
    }
}

extension FeedViewController
{

    func style()
    {
        // you need to pass layout in UICOLLECTIONVIEW()
        let layout = UICollectionViewFlowLayout()
        let vc1 = SearchViewController(collectionViewLayout: layout)
        let vc2 = MainTabViewControlller()
        let vc3 = ImageSelectorViewController()
        let vc4 = NotificationViewController()
        let vc5 = ProfileViewController()


        let feed = templateNavigationController(selectedImage: UIImage(named: "home_selected")!, unselectedImage: UIImage(named: "home_unselected")!, rootViewController: vc1)
        let search = templateNavigationController(selectedImage: UIImage(named: "search_selected")!, unselectedImage: UIImage(named: "search_unselected")!, rootViewController: vc2)
        let imageSelector = templateNavigationController(selectedImage: UIImage(named: "plus_unselected")!, unselectedImage: UIImage(named: "plus_unselected")!, rootViewController:vc3)
        let notification = templateNavigationController(selectedImage: UIImage(named: "like_selected")!, unselectedImage: UIImage(named: "like_unselected")!, rootViewController: vc4)
        let profile = templateNavigationController(selectedImage: UIImage(named: "profile_selected")!, unselectedImage: UIImage(named: "profile_unselected")!, rootViewController: vc5)



        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .black
        viewControllers = [feed , search , imageSelector , notification , profile]




    }
    func templateNavigationController(selectedImage:UIImage , unselectedImage:UIImage , rootViewController:UIViewController)->UINavigationController
    {
        let nc = UINavigationController(rootViewController: rootViewController)
        nc.tabBarItem.image = unselectedImage
        nc.tabBarItem.selectedImage = selectedImage
        nc.navigationBar.backgroundColor = .systemBackground
        return nc


    }
}


