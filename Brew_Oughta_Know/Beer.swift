//
//  Beer.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/5/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class Beer {
  
  var name : String
  var beerId : String
  var description : String?
  var abv : String?
  var glassRecommendation : String?
  var style : String?
  var styleDescription : String?
  var beerCategory : String?
  var breweries = [Brewery]()
  var breweryName : String?
  
  init(jsonDictionary : [String : AnyObject]) {
    self.name = jsonDictionary["name"] as! String
    self.beerId = jsonDictionary["id"] as! String
    
    if let description = jsonDictionary["description"] as? String {
      self.description = jsonDictionary["description"] as? String
    }
    if let abv = jsonDictionary["abv"] as? String {
      self.abv = abv
    }
    
//    let glassDictionary = jsonDictionary["glass"] as [String : AnyObject]
//    if let glassRecommendation = glassDictionary["name"] as? String {
//      self.glassRecommendation = glassDictionary["name"] as? String
//    } else {
//      println("no glass")
//    }
    
    let styleDictionary = jsonDictionary["style"] as! [String : AnyObject]
    if let style = styleDictionary["name"] as? String {
      self.style = styleDictionary["name"] as? String
    }
    if let styleDescription = styleDictionary["description"] as? String {
      self.styleDescription = styleDictionary["description"] as? String
    }
    
    let categoryDictionary = styleDictionary["category"] as! [String : AnyObject]
    if let beerCategory = categoryDictionary["name"] as? String {
      self.beerCategory = categoryDictionary["name"] as? String
    }
    
    if let breweryInfo = jsonDictionary["breweries"] as? [[String : AnyObject]] {
      
      for breweryDictionary in breweryInfo {
        let brewery = Brewery(jsonDictionary: breweryDictionary)
        breweries.append(brewery)
        self.breweryName = breweryDictionary["name"] as? String
      }
    }
    
  }
  
   class func beersFromJSON(jsonData : NSData) -> [Beer]? {
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject] {
      if let dataArray = jsonDictionary["data"] as? [[String : AnyObject]] {
        
        println(jsonDictionary)
        
        var beers = [Beer]()
        for data in dataArray {
          var beer = Beer(jsonDictionary: data)
          beers.append(beer)
        }
        
        return beers
        }
        return nil
      } else {
        return nil
      }
    }
}
