//
//  SearchBreweryTableViewCell.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/12/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class SearchBreweryTableViewCell: UITableViewCell {

  @IBOutlet weak var smallBreweryIcon: UIImageView!
  @IBOutlet weak var breweryLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
      self.smallBreweryIcon.layer.cornerRadius = 8.0
      
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
