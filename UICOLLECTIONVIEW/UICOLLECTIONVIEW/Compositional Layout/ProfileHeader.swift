import UIKit

class ProfileHeader:UICollectionReusableView
{
    
  
    public var Label:UILabel =
    {
        let label = UILabel()
        label.text = "Catagories"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
   
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("SOMETHING WENT WRONG WITH VIEWS")
    }
    
    @objc func handleEditProfileTabped()
    {
        
    }
}

extension ProfileHeader
{
    // MARK: STYLE
    func style()
    {
        Label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(Label)
//        view.translatesAutoresizingMaskIntoConstraints = true
//        addSubview(view)
        
        
    }
    // MARK: LAYOUT
    func layout() {
       // Label.frame = bounds
        Label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        Label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        Label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        Label.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -10).isActive = true
//    }
    }

    
    
    
   
}
