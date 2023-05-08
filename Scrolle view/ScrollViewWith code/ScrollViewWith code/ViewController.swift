//
//  ViewController.swift
//  ScrollViewWith code
//
//  Created by jahanzaib on 06/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //FIRST WE NEDD A SCROLL VIEW
    private let scrollView:UIScrollView =
    {
       let sv = UIScrollView()
        sv.backgroundColor = .red
        return sv
    }()
    
    private let contentView:UIView =
    {
        let sv = UIView()
        
        return sv
    }()
    
    private let imageView:[UIView] =
    {
        var views:[UIView] = []
        var color:[UIColor] = [.systemPink , .white , .black]
        for itr in 1...5
        {
         let sv = UIView()
         sv.backgroundColor = color[itr%3]
            views.append(sv)
        }
        return views
    }()
    

    // only call onces when it load in the memory
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        setup()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("THE DATA IS \(scrollView.contentSize)")
    }
    
   


}


extension ViewController
{
    
    func setup()
    {
        
       
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        
       
        
        
        
    }
    
    func layout()
    {
//        By setting a lower priority for the contentView height constraint, you provide flexibility in the layout system to adjust the height of the contentView based on the intrinsic size of its subviews e.g ImageView, allowing them to be fully visible within the scroll view.
        let hei = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hei.isActive = true
        hei.priority = UILayoutPriority(50)
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
          
        
            
            
            
        ])
        
        for imageView in self.imageView {
               imageView.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(imageView)
        }
        
        NSLayoutConstraint.activate([
            
            imageView[0].topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView[0].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView[0].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView[0].heightAnchor.constraint(equalToConstant: 300),
            
            
            
            imageView[1].topAnchor.constraint(equalTo: imageView[0].bottomAnchor, constant: 20),
            imageView[1].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView[1].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView[1].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView[1].heightAnchor.constraint(equalToConstant: 300),
            
            imageView[2].topAnchor.constraint(equalTo: imageView[1].bottomAnchor, constant: 20),
            imageView[2].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView[2].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView[2].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView[2].heightAnchor.constraint(equalToConstant: 300),
            
            
            
            imageView[3].topAnchor.constraint(equalTo: imageView[2].bottomAnchor, constant: 20),
            imageView[3].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView[3].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView[3].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView[3].heightAnchor.constraint(equalToConstant: 300),
            
            imageView[4].topAnchor.constraint(equalTo: imageView[3].bottomAnchor, constant: 20),
            imageView[4].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView[4].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView[4].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView[4].heightAnchor.constraint(equalToConstant: 300),
            imageView[4].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            

            
        ])
    }
}

 
