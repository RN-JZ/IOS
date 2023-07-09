import UIKit
import Firebase


private let reuseIdentifier = "cell"

class FeedViewControlller: UICollectionViewController
{
    
    //var isExpanded = [Bool]()
    private var posts = [Post]()

    // MARK: -  LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.collectionView.reloadData()
        setup()
        FetchPost()
        
   
        
    }
    //MARK: - API
    func FetchPost()
    {
        PostService.fecthPosts { data in
            self.posts = data
            self.collectionView.reloadData()
            
        }
    }
    @objc func handleLogout()
    {
        do{
            print("DEBUG: in LOGOUT")
            try Auth.auth().signOut()
            let nav = UINavigationController(rootViewController: LoginUserViewController())
            nav.modalPresentationStyle = .fullScreen
            self.present(nav,animated: true , completion: nil)
        }
        catch
        {
            print("DEBUG: FAILED TO LOGOUT")
        }
    }
    
    // MARK: - HELPERS
    
    func setup()
    {
        //collectionView.backgroundColor = .white
//
//        for _ in 0..<2 {
//            isExpanded.append(false)
//        }
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain , target: self, action: #selector(handleLogout))
       
    }
    
}


// MARK: - UICOLLECTIONVIEWDataSource

extension FeedViewControlller
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:reuseIdentifier,for:indexPath)as! FeedCell
        cell.viewModel = PostViewModel(post: posts[indexPath.row])
        // cell.updatePostImage(isExpanded: isExpanded[indexPath.item])
        // cell.backgroundColor = .red
        
        return cell
    }
    
    // FOR COLLASPSE CELL
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print("Selected item is \(indexPath.item)")
//        // Toggle the expanded state for the selected cell
//           isExpanded[indexPath.item] = !isExpanded[indexPath.item]
//        collectionView.reloadItems(at: [indexPath])
//
//
//    }
    
}

// MARK: -UICollectionViewDelegateFlowLayout

extension  FeedViewControlller:UICollectionViewDelegateFlowLayout
{
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = view.frame.width + 8 + 50 + 8
        height += 110
       return CGSize(width: view.frame.width, height: height)
    
       
       // FOR COLLASPSE CELL
    
//    if isExpanded[indexPath.item] {
//           // Return the expanded size for the cell
//           return CGSize(width: collectionView.bounds.width, height: 200)
//       } else {
//           // Return the collapsed size for the cell
//                 return CGSize(width: view.frame.width, height: height)
//       }
   }

}


