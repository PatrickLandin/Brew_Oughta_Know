//
//  SearchBeerViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/6/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//


import UIKit

class SearchBeerViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var beers = [Beer]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.dataSource = self
      self.searchBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    self.searchBar.resignFirstResponder()
    
    NetworkController.shareNetworkController.fetchBeersForSearchTerm(self.searchBar.text, completionHandler: { (beers, error) -> (Void) in
      if error == nil {
        self.beers = beers
        self.tableView.reloadData()
      } else {
        println("No search results")
        // Probably need to add a meesage for the user here
      }
    })
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.beers.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("BEER_CELL", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel?.text = self.beers[indexPath.row].name
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_BEER_DETAIL" {
      let destinationVC = segue.destinationViewController as BeerDetailViewController
      let selectedIndexPath = self.tableView.indexPathForSelectedRow()
      let beer = self.beers[selectedIndexPath!.row]
      destinationVC.selectedBeer = beer
    }
  }
  
}
