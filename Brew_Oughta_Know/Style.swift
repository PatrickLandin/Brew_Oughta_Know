//
//  Style.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/19/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class Style {
  
  var styleName : String
  
  init(jsonDictionary : [String : AnyObject]) {
    self.styleName = jsonDictionary["name"] as String
  }
  
  class func stylesFromJSON(jsonData : NSData) -> [Style]? {
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject] {
      if let dataArray = jsonDictionary["data"] as? [[String : AnyObject]] {
        
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