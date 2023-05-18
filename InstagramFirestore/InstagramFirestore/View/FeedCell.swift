
import UIKit

class FeedCell:UICollectionViewCell
{
    //MARK: - Property
    var stackView = UIStackView()
    private let profileImageView:UIImageView =
    {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "venom-7")
        return iv
        
    }()
    
    private lazy var  userNameButton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
        
    }()
    
    private let postlmageView: UIImageView =
    {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds=true
    iv.isUserInteractionEnabled = true
    iv.image = UIImage(named: "venom-7")
        return iv }()
    
    // FOR COLLAPSE CELL
    
//    private lazy var postImageViewHeightConstraint: NSLayoutConstraint = {
//        let constraint = postlmageView.heightAnchor.constraint(equalToConstant: 0)
//        constraint.priority = UILayoutPriority(999)
//        constraint.isActive = true
//        return constraint
//    }()
    
    private lazy var LikeButton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"like_unselected"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    private lazy var commentButton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"like_unselected"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    private lazy var shareButton:UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"send2"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    private let likeLabel:UILabel =
    {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    private let captionLabel:UILabel =
    {
        let label = UILabel()
        label.text = " Some test caption forn noe"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let postTimeLabel:UILabel =
    {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("SOMETHING WENT WRONG WITH VIEWS")
    }
}

extension FeedCell
{
    
    func style()
    {
        
        profileImageView.layer.cornerRadius = 40/2
        addSubview(profileImageView)
        
        addSubview(userNameButton)
        
        addSubview(postlmageView)
        
        addSubview(likeLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
    }
    func layout()
    {
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12, width: 40, height: 40)
        userNameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        postlmageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,right: rightAnchor, paddingTop: 8)
        postlmageView.heightAnchor.constraint(equalTo:widthAnchor , multiplier: 1).isActive = true
        configureActionButton()
        likeLabel.anchor(top: stackView.bottomAnchor, left:leftAnchor,paddingTop: -4, paddingLeft: 8)
        
        captionLabel.anchor(top: likeLabel.bottomAnchor, left:leftAnchor,paddingTop: 8, paddingLeft: 8)
        
       postTimeLabel.anchor(top: captionLabel.bottomAnchor, left:leftAnchor,paddingTop: 8, paddingLeft: 8)
        


    }
    
    
    // for collapse cell
    
//    func updatePostImage(isExpanded: Bool) {
//        if isExpanded {
//            postImageViewHeightConstraint.constant = 1
//        } else {
//
//            postImageViewHeightConstraint.constant = 370 // Set the collapsed height
//        }
//
//
//        //postImageViewHeightConstraint.isActive = true
//        // Call layoutIfNeeded to apply the constraint changes immediately
//        layoutIfNeeded()
//    }
    
    func configureActionButton()
    {
        stackView = UIStackView(arrangedSubviews: [LikeButton , commentButton , shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.anchor(top: postlmageView.bottomAnchor, width: 120, height: 50)
        
        
        
    }
}
