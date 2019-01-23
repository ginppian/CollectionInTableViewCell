//
//  DGTableViewCell.swift
//  pruebaCollectionOnTable
//
//  Created by Gmo Ginppian on 1/21/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

class DGTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let arr = ["eyeroll", "nerd", "pinocho", "sad", "smile", "sunglasses"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "DGCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DGCollectionViewCell")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DGCollectionViewCell", for: indexPath) as? DGCollectionViewCell {
            
            cell.dgimg.image = UIImage(named: arr[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let width = UIScreen.main.bounds.width
        //let width = collectionView.bounds.width
        //let height = width
        
        return CGSize(width: CGFloat(80) , height: CGFloat(80))
    }
}
