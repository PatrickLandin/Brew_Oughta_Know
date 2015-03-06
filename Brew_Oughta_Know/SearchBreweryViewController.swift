//
//  SearchBreweryViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/6/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class SearchBreweryViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var breweries = [Brewery]()

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
    println(searchBar.text)
    
    // Network controller fetch goes here
    
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return self.breweries.count
    return 100
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("BREWERY_CELL", forIndexPath: indexPath) as UITableViewCell
    
    return cell
  }
  
}
