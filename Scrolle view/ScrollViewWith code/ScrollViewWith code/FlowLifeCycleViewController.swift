//
//  FlowLifeCycleViewController.swift
//  ScrollViewWith code
//
//  Created by jahanzaib on 07/05/2023.
//

import UIKit

class FlowLifeCycleViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        print("I AM IN VIEWDIDLOAD")
        
        
        self.view.backgroundColor = .red
        let buttonWidth: CGFloat = 100
           let buttonHeight: CGFloat = 50
        let buttonX = (UIScreen.main.bounds.width - buttonWidth) / 2
           let buttonY = (UIScreen.main.bounds.height - buttonHeight) / 2
           let btn = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
        btn.layer.cornerRadius = 6
        btn.backgroundColor = .blue
        
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        self.view.addSubview(btn)
    }
    
    @objc func buttonTapped() {
        print("IN")
        let otherViewController = ViewController() // Replace with your destination view controller
        navigationController?.pushViewController(otherViewController, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("I AM IN VIEW WILL APPEAR")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("I AM IN VIEW DID APPEAR")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("I AM IN VIEW will DISAPPEAR")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("I AM IN VIEW DID DISAPPEAR")
    }
    
}
