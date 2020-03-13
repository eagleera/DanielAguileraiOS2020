//
//  RestaurantTableViewCell.swift
//  iOS2020
//
//  Created by Noel Aguilera Terrazas on 12/03/20.
//  Copyright © 2020 Daniel Aguilera. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var LogoImg: UIImageView!
    @IBOutlet weak var lblResta: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var restaElement: RestaurantElement? {
        didSet {
            self.lblResta.text = self.restaElement?.homeName
            let urlImage = URL(string: self.restaElement!.logoURL!)
            LogoImg.kf.setImage(with: urlImage)
        }
    }
}
