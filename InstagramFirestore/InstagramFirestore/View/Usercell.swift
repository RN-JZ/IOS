




import Foundation
import UIKit

class UserCell:UITableViewCell
{
    var viewModel:UserCellViewModel?
    {
        didSet
        {
            configure()
        }
    }
    
    var searchImage:UIImageView =
    {
        let img = UIImageView()
        img.image = UIImage(named: "venom-7")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    var userNameLable:UILabel =
    {
        let label = UILabel()
        label.text = "Venom"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
        
    }()
    var FullNameLable:UILabel =
    {
        let label = UILabel()
        label.text = "Venom"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        Style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("CANNOT CREATE TABLE CELL")
    }
}

extension UserCell
{
    func Style()
    {
        addSubview(searchImage)
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        
       
    }
    
    func layout()
    {
        searchImage.setDimensions(height: 48, width: 48)
        searchImage.layer.cornerRadius = 48/2
        searchImage.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
        let stack = UIStackView(arrangedSubviews: [userNameLable , FullNameLable])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        addSubview(stack)
        
        stack.centerY(inView: searchImage, leftAnchor: searchImage.rightAnchor, paddingLeft: 8)
        
        
        
    }
    
    func configure()
    {
        print("DEGUG: I AM IN CONFIGURE")
        guard let viewModel = self.viewModel else {return}
        FullNameLable.text = viewModel.fullName
        userNameLable.text = viewModel.userName
        searchImage.sd_setImage(with: viewModel.profileImage)
    }
}
