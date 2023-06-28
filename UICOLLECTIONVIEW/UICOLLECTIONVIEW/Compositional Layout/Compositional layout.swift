

import UIKit
import SwiftUI

var reusedIdentifier = "composeCell"
let header = "HeaderView"

class CompositionalLayout: UICollectionViewController {

    
    let arrayColor: [UIColor] = [.red, .green, .gray, .blue]
   
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init()
    {
        
        super.init(collectionViewLayout: SceneDelegate.UICompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
    func setup()
    {
       collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusedIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header)
      
    }
    


}

extension CompositionalLayout
{

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusedIdentifier, for: indexPath)
        cell.backgroundColor = arrayColor[indexPath.row%4]
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header, for: indexPath) as! ProfileHeader
        headerView.backgroundColor = .gray
        //headerView.Label.text = "SECTION \(indexPath.section + 1)"
      
        return headerView
    }
    
    
}

struct PreviewViewController_Previews: PreviewProvider
{
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container:UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
           UINavigationController(rootViewController:  CompositionalLayout())

        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
        typealias UIViewControllerType =  UIViewController
    }
}




//extension CompositionalLayout:UICollectionViewDelegateFlowLayout
//{
//   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       
//       let width = collectionView.bounds.width
//       let numberofitemPerRow:CGFloat = 1
//       let spacing:CGFloat =  25
//       let availableWidth = width - spacing * (numberofitemPerRow + 1)
//       let itemDimension = floor(availableWidth / numberofitemPerRow)
//       return CGSize(width: itemDimension , height: itemDimension)
//       
//       
//   }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//}
//    






