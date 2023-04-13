
import Foundation
import UIKit


// FIRST WE NEED UIPAGEVIEWCONTROLLER NO OF PAGES AND CURRENT VC
// SECOND WE NEED IS TO INITILIZE THESE AND SET HOW WE WNAT TO SHOW ONBOARDING
// LASTLY WE USE DELGATE AND VIEWDIDLOAD TO FURTHER INITILIZE

import UIKit

protocol OnboardingContainerViewControllerDelegate:AnyObject
{
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    let backButton = UIButton(type:.system)
    let nextButton = UIButton(type:.system)
    weak var delgate:OnboardingContainerViewControllerDelegate?
    
   
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
       
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardinViewController(heroImageName: "delorean", titleText: "Bankey is faster to use and has a brans new look and feel taht will make you fell like you are in 1989")
        let page2 = OnboardinViewController(heroImageName: "world", titleText: "Make your money around the world quickley and securely")
        let page3 = OnboardinViewController(heroImageName: "thumbs", titleText: "Learn more at www.bankey.com")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
        
      
        
        
      
    }
}

extension OnboardingContainerViewController
{
    func style()
    {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(BackTapped), for: .primaryActionTriggered)
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(NextTapped), for: .primaryActionTriggered)
    }
    
    func setup()
    {
        
        view.backgroundColor = .systemPink
        
        
        //when we add viewcontroller to view we call addchild it will create parent child relation bwtween 2 view controller
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // This method is very important it show which view to show on screen and it will help us to make next button
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
        backButton.isHidden = true
    }
    func layout()
    {
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            
            
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 7),
            
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 7),
            
            
         
            
        ])
        
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else {
            delgate?.didFinishOnboarding()
            return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}



// MARK:- Action
extension OnboardingContainerViewController
{
    @objc func NextTapped()
    {
        backButton.isHidden = false
        let index = getNextVC(current: currentVC)
        if index+1  < pages.count
        {
          currentVC = pages[index+1]
          pageViewController.setViewControllers([pages[index+1]], direction: .forward, animated: true, completion: nil)
        }
        else{
            print("foo IN NEXT")
            delgate?.didFinishOnboarding()
        }
    }
    
    func getNextVC(current:UIViewController) -> Int
    {
        guard let value = pages.firstIndex(of: currentVC) else {
            print("foo-CANOT FIND DATA")
            return 0
            
        }
        return value
    }
    
    @objc func BackTapped()
    {
        let index = getNextVC(current: currentVC)
        print("foo \(index)")
        if index  > 0
        {
          print("foo - IN")
          currentVC = pages[index-1]
          let value = index-1
            pageViewController.setViewControllers([pages[value]], direction: .reverse, animated: true, completion: nil)
            if index == 1
            {
                backButton.isHidden = true
            }
        }
       
    }
}

//// MARK: - ViewControllers
//class ViewController1: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemRed
//    }
//}
//
//class ViewController2: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGreen
//    }
//}
//
//class ViewController3: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBlue
//    }
//}
