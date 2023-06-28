//
//  ViewController.swift
//  UICOLLECTIONVIEW
//
//  Created by jahanzaib on 15/06/2023.
//

import UIKit

var reuseIdentifier = "cell"

class ViewController: UICollectionViewController {

    
    let arrayColor: [UIColor] = [.red, .green, .gray, .blue]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup()
    {
        self.collectionView.register(TitleView.self, forCellWithReuseIdentifier: TitleView.identifier)
       collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
    }
    


}

extension ViewController
{

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleView.identifier, for: indexPath) as! TitleView
            cell.backgroundColor = .gray
            return cell
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = arrayColor[indexPath.row%4]
        return cell
        }
    }
    
    
}

extension  ViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
       if(indexPath.row == 0)
       {
           let width = (view.frame.width - 20)
           print("in 0 WIDT = \(width)")
           
           return CGSize(width: width , height: 30)
       }
       else
       {
           let width = (view.frame.width - 25)/3
           print("in 1+ WIDT = \(width)")
           return CGSize(width: width , height: width)
       }
       
       
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
    

