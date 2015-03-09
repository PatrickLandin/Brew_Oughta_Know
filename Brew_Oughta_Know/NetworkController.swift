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
            println("Great Beer Success")
            
            let results = Beer.beersFromJSON(data)
            if results != nil {
              
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(results!,nil)
              })
            } else {
              println("Beer search error")
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
  
  func fetchBreweriesForSearchTerm(searchTerm : String, completionHandler : ([Brewery], String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/search?key=bd8c3a5a3503d79ea553868ba7189517&q=\(searchTerm)&type=brewery")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            println("Great Brewery Success")
            
            let results = Brewery.breweriesFromJSON(data)
            if results != nil {
              
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(results!, nil)
              })
            } else {
              println("Brewery error")
            }
          default:
            println("Ah crap")
          }
        }
      } else {
        println("crap Brewery data: \(data)")
      }
    })
    dataTask.resume()
  }
  
  func fetchBeersForBrewery(breweryID : String, completionHandler : ([Beer], String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/?key=bd8c3a5a3503d79ea553868ba7189517/brewery/\(breweryID)/beers")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            println("Gots all of the beers")
            
          default:
            println("Ah crap. Didn't get the beers")
          }
        }
      }
    })
  }
  
  
}







