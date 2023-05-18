import UIKit


private let reuseIdentifier = "cell"

class SearchViewController: UICollectionViewController
{
    
    //var isExpanded = [Bool]()

    // MARK: -  LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
   
        
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
    }
    
}


// MARK: - UICOLLECTIONVIEWDataSource

extension SearchViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:reuseIdentifier,for:indexPath)as! FeedCell
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

extension SearchViewController:UICollectionViewDelegateFlowLayout
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


