import UIKit


class ProportionalCentering: UIViewController {
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    var height: CGFloat?
    var width: CGFloat?
    
    var screenBounds: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        style()
        layout()
    }
}
    
    

extension ProportionalCentering {
    func style() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        label1.text = "1"
        label2.text = "2"
        label3.text = "3"
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
       
     
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label1, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
          NSLayoutConstraint(item: label1, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.5, constant: 0.0),

            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            NSLayoutConstraint(item: label3, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: label3, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.5, constant: 0.0),
        ])
    }
}
