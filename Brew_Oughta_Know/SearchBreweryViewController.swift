//
//  SearchBreweryViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/6/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class SearchBreweryViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var breweries = [Brewery]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.dataSource = self
      self.tableView.delegate = self
      self.searchBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    self.searchBar.resignFirstResponder()
    println(searchBar.text)
    
    NetworkController.shareNetworkController.fetchBreweriesForSearchTerm(self.searchBar.text, completionHandler: { (breweries, error) -> (Void) in
      
      if error == nil {
        self.breweries = breweries
        self.tableView.reloadData()
      } else {
        println("Brewery error thing happened")
        // Error
      }
    })
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.breweries.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("BREWERY_CELL", forIndexPath: indexPath) as! SearchBreweryTableViewCell
    cell.breweryLabel.text = self.breweries[indexPath.row].name
    
    var brewery = self.breweries[indexPath.row]
    if brewery.breweryIcon == nil {
      NetworkController.shareNetworkController.fetchBreweryIconForURL(brewery.iconImageURL, completionHandler: { (image) -> (Void) in
        cell.smallBreweryIcon.image = image
        brewery.breweryIcon = image
        self.breweries[indexPath.row] = brewery
      })
    } else {
      cell.smallBreweryIcon.image = brewery.breweryIcon
    }
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_BEER" {
      let destinationVC = segue.destinationViewController as! BreweryDetailViewController
      let selectedIndexPath = self.tableView.indexPathForSelectedRow()
      let brewery = self.breweries[selectedIndexPath!.row]
      destinationVC.selectedBrewery = brewery
    }
  }
  
}
