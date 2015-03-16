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
  var website : String
  var established : String
  var description : String
  var iconImageURL : String
  var breweryIcon : UIImage?
  var mediumImageURL : String
  var mediumImage : UIImage?
  var largeImageURL : String
  var largeImage : UIImage?
  
  init(jsonDictionary : [String : AnyObject]) {
    self.id = jsonDictionary["id"] as String
    self.name = jsonDictionary["name"] as String
    self.website = jsonDictionary["website"] as String
    self.established = jsonDictionary["established"] as String
    self.description = jsonDictionary["description"] as String
    
    let imageDictionary = jsonDictionary["images"] as [String : AnyObject]
//    if let iconImageURL = imageDictionary["icon"] as? String {
      self.iconImageURL = imageDictionary["icon"] as String
      self.mediumImageURL = imageDictionary["medium"] as String
      self.largeImageURL = imageDictionary["large"] as String
//    }
  }
  
  class func breweriesFromJSON(jsonData : NSData) -> [Brewery]? {
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject] {
      if let dataArray = jsonDictionary["data"] as? [[String : AnyObject]] {
        
        println("jsonDictionary: \(jsonDictionary)")
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