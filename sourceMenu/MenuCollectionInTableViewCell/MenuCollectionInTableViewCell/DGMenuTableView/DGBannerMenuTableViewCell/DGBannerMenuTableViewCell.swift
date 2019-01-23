//
//  DGBannerMenuTableViewCell.swift
//  MenuCollectionInTableViewCell
//
//  Created by Gmo Ginppian on 1/22/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

protocol ShowVCCollectionToTable {
    func showvccollectiontotable()
}

enum enumBanner: Int {
    case first = 0
    case second = 1
}

class DGBannerMenuTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var storyboardBase = String()
    var storyboardId = String()
    
    var delegateCollection: ShowVCCollectionToTable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Init Collection
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(UINib.init(nibName: "DGBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DGBannerCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DGBannerCollectionViewCell", for: indexPath) as? DGBannerCollectionViewCell {
            
            //cell.dgimg.image = UIImage(named: "")
            cell.dgimg.backgroundColor = UIColor.red
            return cell
        }
        
        return UICollectionViewCell()
    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.bounds.width
//        let height = CGFloat(200)
//        
//        return CGSize(width: width , height: height)
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case enumBanner.first.rawValue:
//            if let collection = self.superview,
//                let tableViewCell = collection.superview,
//                let table = tableViewCell.superview,
//                let
            
//            let cell = tableView.dequeueReusableCellWithIdentifier("myCustomCellID") as! MyCustomCell
//            cell.selectionStyle = UITableViewCellSelectionStyle.None
//
//            // set the delegate
//            cell.delegate = self
//
//            return cell
            
//            let sb = UIStoryboard(name: "main", bundle: nil)
//            if let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//                vc.delegate?.showvc()
//            }
            
            if let delegate = delegateCollection {
                delegate.showvccollectiontotable()
            }
            
        case enumBanner.second.rawValue:
            if let delegate = delegateCollection {
                delegate.showvccollectiontotable()
            }
        default:
            print("No entra a nada")
        }
    }
    
}

extension DGBannerMenuTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = CGFloat(144)
        return CGSize(width: width, height: height)
    }
}
