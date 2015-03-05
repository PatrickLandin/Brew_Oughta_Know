//
//  NetworkController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/4/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class NetworkController {
  
  //Singleton
  class var shareNetworkController : NetworkController {
    struct Static {
      static let instance : NetworkController = NetworkController()
    }
    return Static.instance
  }
  
  func fetchBeersForSearchTerm(searchTerm : String, completionHandler : ([Beer], String) -> (Void)) {
    
  }
}
