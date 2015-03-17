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
  @IBOutlet weak var beerNameLabel: UILabel!
  var brewery : [Brewery]?
  var selectedBeer : Beer?
  
  override func viewWillAppear(animated: Bool) {
    
    NetworkController.shareNetworkController.fetchBreweryForBeer(self.selectedBeer!.id, completionHandler: { (brewery, error) -> (Void) in
      
      self.brewery = brewery
      
    })
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.beerNameLabel.text = self.selectedBeer?.name

        // Do any additional setup after loading the view.
    }

}
