//
//  DGUsuarioMenuTableViewCell.swift
//  MenuCollectionInTableViewCell
//
//  Created by Gmo Ginppian on 1/22/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

class DGUsuarioMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var dgimg: UIImageView!
    @IBOutlet weak var dglbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Imagen redonda
        self.dgimg.layer.masksToBounds = true
        self.dgimg.layer.cornerRadius = self.dgimg.bounds.size.width / 2.0
        
        // Texto
        self.dglbl.textColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
