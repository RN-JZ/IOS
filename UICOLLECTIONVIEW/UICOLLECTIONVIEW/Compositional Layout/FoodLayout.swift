
import UIKit
import SwiftUI

var Cell = "composeCell"
let headerID = "HeaderView"


enum Sections:String , CaseIterable
{
    case main
    case Catagories
    case info_cards
    case product_card
    
    static func getSection(from intValue: Int) -> Sections? {
         switch intValue {
         case 0:
             return .main
         case 1:
             return .Catagories
         case 2:
             return .info_cards
         case 3:
             return .product_card
         default:
             return nil
         }
     }
}
var Gsection = Sections.getSection(from: 3)

class FoodViewLayout: UICollectionViewController {
    
    init()
    {
        
        super.init(collectionViewLayout: FoodViewLayout.UICompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let arrayColor: [UIColor] = [.red, .green, .gray, .blue]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Food Delivery"
        
        setup()
    }
    
    func setup()
    {
       collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cell)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
      
    }
    
    
    
  
    


}

extension  FoodViewLayout
{

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let value = Sections.getSection(from: section) else {
            print("Invalid section")
            return 0
        }
       
        
        switch value
        {
        case .main :
            return 4
        case .Catagories :
             return 8
        case .info_cards :
             return 5
        case .product_card :
             return 6
    }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell , for: indexPath)
        cell.backgroundColor = arrayColor[indexPath.row%4]
        return cell
        
    }
    
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! ProfileHeader
            return headerView
        }
        
}

extension FoodViewLayout
{
    static func UICompositionalLayout()-> UICollectionViewCompositionalLayout
    {
        return  UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = Sections.getSection(from: sectionIndex) ?? Sections.main
            
            switch section
            {
                
            case .main:
                print("INSIDE MAIN")
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 5
                
                //  Group
                let GroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let Group = NSCollectionLayoutGroup.vertical(layoutSize: GroupSize, subitems: [item])
               
                // Section
                let section = NSCollectionLayoutSection(group:Group)
                section.orthogonalScrollingBehavior = .paging
                return section
                
            case .Catagories:
                print("INSIDE MAIN")
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(150))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                //  Group
                let GroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
                
                let Group = NSCollectionLayoutGroup.horizontal(layoutSize: GroupSize, subitems: [item])
               
                // Section
                let section = NSCollectionLayoutSection(group:Group)
                section.contentInsets.leading = 16
                
                // ADDING HEADER
                       let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.estimated(50))
                       let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
                           layoutSize: headerItemSize,
                           elementKind: UICollectionView.elementKindSectionHeader,
                           alignment: .top
                       )
               
               
               
                       section.boundarySupplementaryItems = [headerItem]
                return section
                
           
               
            case .info_cards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 32
                item.contentInsets.bottom = 5
                
                //  Group
                let GroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125))
                let Group = NSCollectionLayoutGroup.vertical(layoutSize: GroupSize, subitems: [item])
               
                // Section
                let section = NSCollectionLayoutSection(group:Group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                return section
                
            case  .product_card :
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(300))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                //  Group
                let GroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000))
                
                let Group = NSCollectionLayoutGroup.horizontal(layoutSize: GroupSize, subitems: [item])
               
                // Section
                let section = NSCollectionLayoutSection(group:Group)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 0)
               
               
            
                return section
                
                
            
        }
       
        }
  }
}
    




    




//struct PreviewViewController_Previews: PreviewProvider
//{
//    static var previews: some View {
//        Container().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct Container:UIViewControllerRepresentable {
//        func makeUIViewController(context: Context) -> UIViewController {
//           UINavigationController(rootViewController:  FoodViewLayout())
//           
//        }
//        
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//            
//        }
//        typealias UIViewControllerType =  UIViewController
//    }
//}
//
//
