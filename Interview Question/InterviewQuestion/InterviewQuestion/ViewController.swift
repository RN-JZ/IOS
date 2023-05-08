



// WHAT IS DIFFERENCE BETWEEN FRAME AND BOUND ?

//FRAME:
/// The  Frame of UIView is rectangle , expressed as a location (x,y) and size (width , height) relative to its superview it is contained within

//BOUNDS:
/// The bound of UIView is rectangle , expressed as a location (x,y) and size (width , height) relative to its own corrdinates system (0,0).



// IN WHICH CASE COORDINATES ARE DIFF ?
///  The coordinates will be different if  both superview and subview has some distnace b/t them other wise it zero in both


import UIKit

class ViewController: UIViewController {
    
    var rotationDegree:CGFloat = 0
    var redView:UIView =
    {
        var view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    
    var yellowView:UIView =
    {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        layout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("frame \(redView.frame)")
        print("bound \(redView.bounds)")
    }
    
    
    @IBAction func rotate(_ sender: UIButton)
    {
        didRotate()
    }
    
}

extension ViewController
{
    
    
    func setup()
    {
        
        //IMP
//        When you call view.addSubview(demoView) and view.addSubview(frameView) in this order, demoView will be added as a subview of view first, and then frameView will be added as a subview of view on top of demoView.
//
//        So, in terms of the view hierarchy, demoView is a subview of view and frameView is also a subview of view. However, because frameView was added after demoView, it will be positioned on top of demoView in the z-axis (depth) of the view hierarchy.
//
//        Note that the order in which subviews are added can affect their appearance if they overlap. If frameView and demoView have overlapping frames, the one that was added last will be on top and therefore visible.
        
    
        self.view.addSubview(yellowView)
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
       
        
    }
    func layout()
    {
        NSLayoutConstraint.activate([
            
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.heightAnchor.constraint(equalToConstant: 150),
            redView.widthAnchor.constraint(equalToConstant: 300),
            
          
            
        ])
    }
    
    func didRotate()
    {
        rotationDegree += 30
        redView.transform = CGAffineTransform(rotationAngle: rotationDegree * .pi / 180)
        yellowView.frame = redView.frame
        
        
        
        
        print("frame \(redView.frame)")
        print("bound \(redView.bounds)")
        
    }
}

