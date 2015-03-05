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
  
  func fetchBeersForSearchTerm(searchTerm : String, completionHandler : ([Beer], String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/search?key=bd8c3a5a3503d79ea553868ba7189517&q=\(searchTerm)&type=beer")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler : { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            println("Great success")
            
            let results = Beer.beersFromJSON(data)
            if results != nil {
              
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                println()
                completionHandler(results!,nil)
              })
            } else {
//              completionHandler(nil, "error")
            }
          default:
            println("Ah crap")
          }
        }
      } else {
        println("crap data: \(data)")
      }
    })
    dataTask.resume()
  }
}
