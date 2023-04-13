//
//  AppDelegate.swift
//  Bankey
//
//  Created by jahanzaib on 09/04/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // The window is container that holds all visual element of our app
    let loginViewContoller = LoginViewController()
    let onboardingScreen = OnboardingContainerViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewContoller.delegate = self
        onboardingScreen.delgate = self
        var value = LocalState.hasLogin
        window?.rootViewController = value ? ViewController() :loginViewContoller
    
        return true
        
    }

}

extension AppDelegate:LoginViewControllerDelegate
{
    func didLogin() {
        LocalState.hasLogin = true
        if LocalState.hasOnboarded
        {
           setRootViewController(ViewController())
        }
        else
        {
            setRootViewController(onboardingScreen)
        }
        
    }
    
    
}
extension AppDelegate:OnboardingContainerViewControllerDelegate
{
    func didFinishOnboarding() {
        print("foo-Finsh onboarding")
        LocalState.hasOnboarded = true
        setRootViewController(ViewController())
    }
    
    
}


extension AppDelegate
{
    func setRootViewController(_ vc:UIViewController , animation:Bool = true)
    {
        guard let window = self.window
        else{
            print("foo- IN")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}



//When we create an iOS app, we want to display something on the screen for the user to see. The main container that holds all the visual elements of our app is called the window.

//
//In order to display something in the window, we need to add a view controller to it. The view controller contains the code that specifies what should be displayed on the screen.
//
//When we set the root view controller of the window in the app delegate, we are telling the app which view controller should be displayed in the window. However, if we don't specify what the view controller should display, the default view is a transparent background.
//
//So, when we see the window after setting the root view controller, it's because there is a transparent view on top of it. This allows us to see through the app's window and view what is behind it, such as the home screen or another app.
//
//To make the app display something visible, we need to add elements to the view controller's view, such as buttons, labels, or images. Then, when the app is run, the view controller's view will be displayed in the window, and we'll be able to see it instead of the transparent background.

