

import UIKit

class ViewController: UIViewController {
    
   
    let redView:UIView = {
        let red = UIView()
        red.backgroundColor = .red
        
        return red
    }()
    
    let greenView:UIView = {
        let green = UIView()
        green.backgroundColor = .green
        
        return green
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        view.addSubview(redView)
        view.addSubview(greenView)
        layout()
    }


}

extension ViewController
{
    func layout()
    {
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 50),
                    redView.topAnchor.constraint(equalTo: view.topAnchor , constant: 50),
                    redView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -50),
                    redView.bottomAnchor.constraint(equalTo: greenView.topAnchor , constant: -50),
                    greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 50),
                    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -50),
                    greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -50),
                    greenView.heightAnchor.constraint(equalTo: redView.heightAnchor)
                ])
    }
}

