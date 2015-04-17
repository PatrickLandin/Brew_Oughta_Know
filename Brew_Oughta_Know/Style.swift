 //
//  Style.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/19/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class Style {
  
  var styleId : Int
  var styleName : String
  var categoryName : String
  var styleDescription : String?
  var abvMin : String?
  var abvMax : String?
  var ibuMin : Int?
  var ibuMax : Int?
  var ogMin : String?
  var fgMin : String?
  var fgMax : String?
  
  init(jsonDictionary : [String : AnyObject]) {
    
    self.styleId = jsonDictionary["id"] as! Int
    self.styleName = jsonDictionary["name"] as! String
    
    let categoryDictionary = jsonDictionary["category"] as! [String : AnyObject]
    self.categoryName = categoryDictionary["name"] as! String
    
    if let styleDescription = jsonDictionary["description"] as? String {
      self.styleDescription = styleDescription
    }
    if let abvMin = jsonDictionary["abvMin"] as? String {
      self.abvMin = abvMin
    }
    if let abvMax = jsonDictionary["abvMax"] as? String {
      self.abvMax = abvMax
    }
    if let ibuMin = jsonDictionary["ibuMin"] as? Int {
      self.ibuMin = ibuMin
    }
    if let ibuMax = jsonDictionary["ibuMax"] as? Int {
      self.ibuMax = ibuMax
    }
    if let ogMin = jsonDictionary["ogMin"] as? String {
      self.ogMin = ogMin
    }
    if let fgMin = jsonDictionary["fgMin"] as? String {
      self.fgMin = fgMin
    }
    if let fgMax = jsonDictionary["fgMax"] as? String {
      self.fgMax = fgMax
    }
  }
  
  class func stylesFromJSON(jsonData : NSData) -> [Style]? {
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject] {
      if let dataArray = jsonDictionary["data"] as? [[String : AnyObject]] {
        
        println(jsonDictionary)
        
        var styles = [Style]()
        for data in dataArray {
          var style = Style(jsonDictionary: data)
          styles.append(style)
        }
        return styles
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
}