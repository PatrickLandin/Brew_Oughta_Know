//
//  SearchStyleViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/19/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class SearchStyleViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var styles = [Style]()
  
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
    
    NetworkController.shareNetworkController.fetchStylesForSearchTerm(self.searchBar.text, completionHandler: { (styles, error) -> (Void) in
      if error == nil {
//        println("StyleId after search : \(self.styles.styleId)")
        self.styles = styles
        self.tableView.reloadData()
      } else {
        println("Network error for style search")
        // user should get a notification here
      }
    })
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.styles.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("STYLE_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    cell.textLabel?.text = self.styles[indexPath.row].styleName
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_STYLE_DETAIL" {
      let destinationVC = segue.destinationViewController as! StyleDetailViewController
      let selectedIndexPath = self.tableView.indexPathForSelectedRow()
      let style = self.styles[selectedIndexPath!.row]
      destinationVC.selectedStyle = style
    }
  }

}
