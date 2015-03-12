//
//  BeerDetailViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/10/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

  @IBOutlet weak var breweryLabel: UILabel!
  var brewery : Brewery?
  var selectedBeer : Beer?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.breweryLabel.text = self.brewery?.name
      
      NetworkController.shareNetworkController.fetchBreweryForBeer(self.selectedBeer!.id, completionHandler: { (brewery, error) -> (Void) in
        
        // Do something in here for beer detail

      })

        // Do any additional setup after loading the view.
    }

}
