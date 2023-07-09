import UIKit

private let profileIdentifier = "profilecell"
private let headerIdentifier = "headercell"
class ProfileViewController: UICollectionViewController
{

    var user:User
    
    init(user:User)
    {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        checkIfUserISFollowed()
        fetchUserStats()
        
        
       
    }
  
    // MARK: - API
     func checkIfUserISFollowed()
    {
        print("DEBUG \(user.uid)")
        UserService.checkifUserisFollowed(uid: user.uid) { check in
            self.user.isFollowed = check
            self.collectionView.reloadData()
        }
    }
    
    func fetchUserStats()
    {
        UserService.fetchUserStats(uid: user.uid) { UserStats in
            self.user.stats = UserStats
            self.collectionView.reloadData()
            
            print("DEBUG \(UserStats)")
        }
    }
   
   
  
    
    func setup()
    {
        navigationItem.title = user.fullName
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: profileIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }


}


//// MARK: - VIEW DELEGATE
//extension ProfileViewController
//{
//   
//}


// MARK: - DATASOURCE
extension ProfileViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:profileIdentifier,for:indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeader
        headerView.delegate = self
       
        headerView.viewModel = ProfileHeaderViewModel(self.user)
        return headerView
    }
}

// MARK: -UICollectionViewDelegateFlowLayout
extension ProfileViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width-6)/3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
    }
}

extension ProfileViewController:ProfileHeaderDelegate
{
    func header(_ profileHeader: ProfileHeader, didTabActionFor user: User) {
        if user.currentUser
        {
            print("EDIT BUTTON")
        }
        else if user.isFollowed
        {
            UserService.unfollow(uid: user.uid) { error in
                self.user.isFollowed = false
                self.collectionView.reloadData()
            }
        }
        else{
            UserService.follow(uid: user.uid)
            {
                error in
                print("BUTTON \(error)")
                self.user.isFollowed = true
                self.collectionView.reloadData()
            }
        }
    }
    
    
}


