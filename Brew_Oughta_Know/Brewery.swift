//
//  Brewery.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/6/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class Brewery {
  
  var id : String
  var name : String
  
  init(jsonDictionary : [String : AnyObject]) {
    self.id = jsonDictionary["id"] as String
    self.name = jsonDictionary["name"] as String
  }
  
  class func breweriesFromJSON(jsonData : NSData) -> [Brewery]? {
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject] {
      if let dataArray = jsonDictionary["data"] as? [[String : AnyObject]] {
        
        var breweries = [Brewery]()
        for data in dataArray {
          var brewery = Brewery(jsonDictionary: data)
          breweries.append(brewery)
        }
        return breweries
      }
      return nil
    } else {
      return nil
    }
  }
  
}