
import UIKit
import Firebase
import YPImagePicker

class MainTabController:UITabBarController, AutheticationDelegate
{
    

    
    private var user:User?
    {
        didSet
        {
            guard let user = user else {return}
            style(withUser: user)
        }
        
        
    }
    static  var SelectedIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        checkifuserLogin()
        fetchUser()
       // logout()
        print("DEBUG: I am in")
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex), name: Notification.Name("SendData"), object: nil)
    }
    @objc func changeIndex()
    {
        selectedIndex = 0
    }
    
    
    // MARK: - API
    
    func checkifuserLogin()
    {
        if Auth.auth().currentUser == nil
        {
            DispatchQueue.main.async {
                print("DEBUG: IN USER")
                let controller =  LoginUserViewController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController:controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav,animated: true , completion: nil)
            }
           
        }
    }
    
    //MARK:- API
   
    func fetchUser()
    {
        UserService.fetchUser{ user in
            
            
            self.user = user
            self.navigationItem.title = user.userName
        }
            
            
    }
    
    
    // MARK: - DELEGATE
    func authenticationComplete() {
        print("DEBUG: LOGIN SUCCESS")
        fetchUser()
        
    }
    
    
 
}

extension MainTabController
{

    func style(withUser user:User)
    {
        // you need to pass layout in UICOLLECTIONVIEW()
        let layout = UICollectionViewFlowLayout()
        let vc1 = FeedViewControlller(collectionViewLayout: layout)
        
        let vc2 = SearchController()
        let vc3 = ImageSelectorViewController()
        let vc4 = NotificationViewController()
        let vc5 = ProfileViewController(user:user)


        let feed =    templateNavigationController(selectedImage: UIImage(named: "home_selected")!, unselectedImage: UIImage(named: "home_unselected")!, rootViewController: vc1)
        let search = templateNavigationController(selectedImage: UIImage(named: "search_selected")!, unselectedImage: UIImage(named: "search_unselected")!, rootViewController: vc2)
        let imageSelector = templateNavigationController(selectedImage: UIImage(named: "plus_unselected")!, unselectedImage: UIImage(named: "plus_unselected")!, rootViewController:vc3)
        let notification = templateNavigationController(selectedImage: UIImage(named: "like_selected")!, unselectedImage: UIImage(named: "like_unselected")!, rootViewController: vc4)
        let profile = templateNavigationController(selectedImage: UIImage(named: "profile_selected")!, unselectedImage: UIImage(named: "profile_unselected")!, rootViewController: vc5)



        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .black
        
        viewControllers = [feed , search , imageSelector , notification , profile]
  
        selectedIndex = MainTabController.SelectedIndex



    }
    
    func templateNavigationController(selectedImage:UIImage , unselectedImage:UIImage , rootViewController:UIViewController)->UINavigationController
    {
        let nc = UINavigationController(rootViewController: rootViewController)
        nc.tabBarItem.image = unselectedImage
        nc.tabBarItem.selectedImage = selectedImage
        nc.navigationBar.backgroundColor = .systemBackground
        return nc


    }
    
    
    // MARK: - image picker
    func didFinishedPickingMedia(_ picker:YPImagePicker)
    {
        picker.didFinishPicking { items, _ in
            picker.dismiss(animated: false)
            {
                guard let photo = items.singlePhoto?.image else {return}
                print("SELECTED IMAGE IS \(photo) ")
                
                let controller = UploadPostControllers()
                controller.selectedImage = photo
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false, completion: nil)
            }
           
        }
        
        
    }
}

extension MainTabController:UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2
        {
            var config = YPImagePickerConfiguration()
            config.library.mediaType = .photo
            config.shouldSaveNewPicturesToAlbum = false
            config.startOnScreen = .library
            config.screens = [.library]
            config.library.maxNumberOfItems = 1
            
            let picker = YPImagePicker(configuration: config)
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
            didFinishedPickingMedia(picker)
            
        }
        
        
        return true
    }
    
   
}


