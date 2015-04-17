//
//  BreweryDetailViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/9/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class BreweryDetailViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var breweryLabel: UILabel!
  @IBOutlet weak var websiteLabel: UILabel!
  @IBOutlet weak var yearEstLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var breweryIcon: UIImageView!
  var beers = [Beer]()
  var selectedBrewery : Brewery?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.dataSource = self
      self.breweryIcon.layer.cornerRadius = 10.0
      self.breweryIcon.layer.masksToBounds = true
      self.breweryIcon.contentMode = UIViewContentMode.ScaleAspectFill
      self.breweryLabel.text = self.selectedBrewery?.name
      self.websiteLabel.text = self.selectedBrewery?.website
      self.yearEstLabel.text = self.selectedBrewery?.established
      self.descriptionLabel.text = self.selectedBrewery?.description
      
      if selectedBrewery?.mediumImage == nil {
        
        NetworkController.shareNetworkController.fetchMediumImageForBrewery(self.selectedBrewery!.mediumImageURL, completionHandler: { (image) -> (Void) in
          self.breweryIcon.image = image
        })
      } else {
        self.breweryIcon.image = self.selectedBrewery?.mediumImage
      }
      
     NetworkController.shareNetworkController.fetchBeersForBrewery(self.selectedBrewery!.id, completionHandler: { (beers, error) -> (Void) in
      
      if error == nil {
        self.beers = beers
        self.tableView.reloadData()
      } else {
        println("Calling for brewery's beers failed")
      }
     })

        // Do any additional setup after loading the view.
    }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.beers.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("BEERS_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    cell.textLabel?.text = self.beers[indexPath.row].name
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_BEER_DETAIL" {
      let destinationVC = segue.destinationViewController as! BeerDetailViewController
      let selectedIndexPath = self.tableView.indexPathForSelectedRow()
      let beer = self.beers[selectedIndexPath!.row]
      destinationVC.selectedBeer = beer
      destinationVC.selectedBrewery = selectedBrewery
    }
  }

}
