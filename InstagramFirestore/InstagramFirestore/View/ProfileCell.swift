
import UIKit

class ProfileCell:UICollectionViewCell
{
    //MARK: - PROPERTIES
    private var profileImageView:UIImageView =
    {
        let img = UIImageView()
        img.image = UIImage(named: "venom-7")
        img.contentMode = .scaleToFill
        return img
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
    
  
}

extension ProfileCell
{
    // MARK: STYLE
    func style()
    {
        addSubview(profileImageView)
    }
    // MARK: LAYOUT
    func layout()
    {
        profileImageView.fillSuperview()
    }
    
    
    
    
}



