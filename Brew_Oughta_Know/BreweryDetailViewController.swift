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
  var beers = [Beer]()
  var selectedBrewery : Brewery?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.dataSource = self
      
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
    return 100
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("BEERS_CELL", forIndexPath: indexPath) as UITableViewCell
    
//    cell.textLabel?.text = selectedBrewery?
    
    return cell
  }

}
