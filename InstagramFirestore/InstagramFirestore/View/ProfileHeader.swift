
import UIKit
import SDWebImage

protocol ProfileHeaderDelegate:class
{
    func header(_ profileHeader:ProfileHeader , didTabActionFor user:User)
}

class ProfileHeader:UICollectionReusableView
{
    // Delgate
    weak var delegate : ProfileHeaderDelegate?
    
    //MARK: - VIEWMODEL
    var viewModel:ProfileHeaderViewModel?{
        didSet
        {
            configure()
        }
    }
    //MARK: - PROPERTIES
    var stack:UIStackView!
    var btnStack:UIStackView!
    private var postImageView:UIImageView =
    {
        let img = UIImageView()
        img.image = UIImage(named: "venom-7")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    private let nameLabel:UILabel =
    {
        let label = UILabel()
        label.text = "KING PING"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var editProfileFolloWbutton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize:14)
        button.addTarget(self, action: #selector(handleEditProfileTabped), for: .touchUpInside)
        return button
    }()
    private lazy var postLabel:UILabel =
    {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
       // label.attributedText =  attributedStatText(value: 6, label: "post")
        return label
    }()
    private lazy var followerLabel:UILabel =
    {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        //label.attributedText =  attributedStatText(value: 6, label: "follower")
        return label
    }()
    private lazy var followingLabel:UILabel =
    {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        //label.attributedText =  attributedStatText(value: 6, label: "following")
        return label
    }()
    
    private let gridbutton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"grid"), for: .normal)
        return button
    }()
    
    private let listbutton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"list"), for: .normal)
        return button
    }()
    private let bookmarkbutton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"ribbon"), for: .normal)
        return button
    }()
    
    private var topDivider:UIView =
    {
        let divide = UIView()
        divide.backgroundColor = .lightGray
        return divide
    }()
    private var bottomDivider:UIView =
    {
        let divide = UIView()
        divide.backgroundColor = .lightGray
        return divide
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
    // MARK: - Action
    @objc func handleEditProfileTabped()
    { 
        guard let user = viewModel?.user else {return }
        delegate?.header(self, didTabActionFor: user)
        
    }
}

extension ProfileHeader
{
    // MARK: STYLE
    func style()
    {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(postImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        editProfileFolloWbutton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editProfileFolloWbutton)
        
        
        
       
        topDivider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topDivider)
        addSubview(bottomDivider)
        
        
    }
    // MARK: LAYOUT
    func layout()
    {
        postImageView.anchor(top:topAnchor, left: leftAnchor,paddingTop: 16, paddingLeft: 12)
        postImageView.setDimensions(height: 80, width: 80)
        postImageView.layer.cornerRadius = 80/2
        
        nameLabel.anchor(top: postImageView.bottomAnchor, left: leftAnchor,paddingTop: 12, paddingLeft: 12)
        
        editProfileFolloWbutton.anchor(top: nameLabel.bottomAnchor, left: leftAnchor , right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        stack = UIStackView(arrangedSubviews: [postLabel , followerLabel , followingLabel])
        addSubview(stack)
        stack.distribution = .fillEqually
        stack.centerY(inView:postImageView)
        stack.anchor(left: postImageView.rightAnchor,  right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
        
        
        btnStack = UIStackView(arrangedSubviews: [gridbutton , listbutton , bookmarkbutton])
        addSubview(btnStack)
        btnStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,height: 50)
        btnStack.distribution = .fillEqually
        
        
        topDivider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topDivider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topDivider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        btnStack.topAnchor.constraint(equalTo: topDivider.bottomAnchor).isActive = true
        bottomDivider.anchor(top: btnStack.bottomAnchor,left: leftAnchor, right: rightAnchor,height: 0.5)
    }
    
    
    
    // MARK: HELPER
    
   
    
    func configure()
    {
        print("DEGUG: I AM IN CONFIGURE")
        guard let viewModel = self.viewModel else {return}
        nameLabel.text = viewModel.fullName
        editProfileFolloWbutton.setTitle(viewModel.FollowedButtonText, for: .normal)
        editProfileFolloWbutton.backgroundColor = viewModel.followButtonBackgroundColor
        editProfileFolloWbutton.setTitleColor(viewModel.followButtonTextColor, for: .normal)
        postImageView.sd_setImage(with: viewModel.profileImage)
        followerLabel.attributedText =  viewModel.numberOfFollowers
        followingLabel.attributedText = viewModel.numberOfFollowing
        postLabel.attributedText = viewModel.numberOfPosts
}
}


