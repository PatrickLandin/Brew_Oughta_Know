//
//  BeerDetailViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/10/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

  @IBOutlet weak var beerNameLabel: UILabel!
  @IBOutlet weak var breweryNameLabel: UILabel!
  @IBOutlet weak var styleNameLabel: UILabel!
  @IBOutlet weak var styleCategoryLabel: UILabel!


  var brewery : [Brewery]?
  var selectedBeer : Beer?
  var selectedBrewery : Brewery?
  
  override func viewWillAppear(animated: Bool) {
    
    NetworkController.shareNetworkController.fetchBreweryForBeer(self.selectedBeer!.beerId, completionHandler: { (brewery, error) -> (Void) in
      
      if error == nil {
        self.brewery = brewery
        println("Fetching brewery for beer has worked")
        println(brewery)
      } else {
        println("Calling for beer's brewery failed")
      }
    })
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.beerNameLabel.text = self.selectedBeer?.name
      self.breweryNameLabel.text = self.selectedBrewery?.name
      self.styleNameLabel.text = self.selectedBeer?.style
      self.styleCategoryLabel.text = self.selectedBeer?.beerCategory
      
        // Do any additional setup after loading the view.
    }

}
