

import UIKit


class ProportionalCentering:UIViewController
{
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        style()
        layout()
    }
}

extension ProportionalCentering
{
    func style()
    {
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
    func layout()
    {
        NSLayoutConstraint.activate([
            
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-100),
            
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label3.centerYAnchor.constraint(equalTo: view.centerYAnchor  ,constant:100),
            
           
            
        ])
        // WE NEED TO USE NS LAYOUT CONSTRAINT WE SEE IT TOMORROW
    }
}
