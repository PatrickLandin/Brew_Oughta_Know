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
  @IBOutlet weak var abvLabel: UILabel!
  
  var selectedBeer : Beer?
  var selectedBrewery : Brewery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.beerNameLabel.text = self.selectedBeer?.name
      self.styleNameLabel.text = self.selectedBeer?.style
      self.styleCategoryLabel.text = self.selectedBeer?.beerCategory
      self.abvLabel.text = self.selectedBeer?.abv
      
      if selectedBrewery != nil {
        self.breweryNameLabel.text = self.selectedBrewery?.name
      } else {
        self.breweryNameLabel.text = self.selectedBeer?.breweryName
      }
      
        // Do any additional setup after loading the view.
    }

}






//    NetworkController.shareNetworkController.fetchBreweryForBeer(self.selectedBeer!.beerId, completionHandler: { (breweries, error) -> (Void) in
//
//      if error == nil {
//        self.breweries = breweries
//        //Having trouble using the array of breweries to set brewery name
//        println("Fetching brewery for beer has worked")
//        println(breweries)
//      } else {
//        println("Calling for beer's brewery failed")
//      }
//    })
