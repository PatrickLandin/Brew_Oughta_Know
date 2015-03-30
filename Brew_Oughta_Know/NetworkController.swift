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
  
  let imageQueue = NSOperationQueue()
  
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
              println("results: \(results)")
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
  
  func fetchStylesForSearchTerm(searchTerm : String, completionHandler : ([Style], String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/search/style?key=bd8c3a5a3503d79ea553868ba7189517&q=\(searchTerm)")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          switch httpResponse.statusCode {
          case 200...299:
            println("Great Style Success")
            
            let results = Style.stylesFromJSON(data)
            if results != nil {
              println("results = \(results)")
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(results!, nil)
              })
            } else {
              println("Crap style error")
            }
          default:
            println("Ah crap")
          }
        } else {
          println("Crap style data : \(data)")
        }
      }
    })
    dataTask.resume()
  }
  
  func fetchBeersForBrewery(breweryID : String, completionHandler : ([Beer], String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/brewery/\(breweryID)/beers?key=bd8c3a5a3503d79ea553868ba7189517")
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
            
            let results = Beer.beersFromJSON(data)
            if results != nil {
              
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(results!, nil)
              })
            }
          default:
            println("Ah crap. Didn't get the beers.")
          }
        }
      }
    })
    dataTask.resume()
  }
  
  func fetchBreweryForBeer(breweryID : String, completionHandler : ([Brewery], String?) ->(Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/beer/\(breweryID)/breweries?key=bd8c3a5a3503d79ea553868ba7189517")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            println("Gots the brewery for the beer")
            
            let results = Brewery.breweriesFromJSON(data)
            if results != nil {
              
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(results!, nil)
              })
            }
            
          default:
            println("Ah crap. Didn't get the brewery.")
          }
        }
      }
    })
    dataTask.resume()
  }
  
  func fetchStyleDetail(styleId : String, completionHandler : ([String : AnyObject]?, String?) -> (Void)) {
    let url = NSURL(string: "http://api.brewerydb.com/v2/style/\(styleId)?key=bd8c3a5a3503d79ea553868ba7189517")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    var urlSession = NSURLSession.sharedSession()
    let dataTask = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      if error == nil {
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            println("Fetch description for style success")
            
            if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String : AnyObject] {
            
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completionHandler(jsonDictionary, nil)
              })
            }
            
          default:
            println("Ah crap. Didn't get the style description")
          }
        }
      }
    })
    dataTask.resume()
  }
  
  func fetchBreweryIconForURL(url : String, completionHandler : (UIImage) -> (Void)) {
    let url = NSURL(string: url)
    
    self.imageQueue.addOperationWithBlock { () -> Void in
      let imageData = NSData(contentsOfURL: url!)
      let image = UIImage(data: imageData!)
      
      NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        completionHandler(image!)
      })
    }
  }
  
  func fetchMediumImageForBrewery(url : String, completionHandler : (UIImage) -> (Void)) {
    let url = NSURL(string: url)
    
    self.imageQueue.addOperationWithBlock { () -> Void in
      let imageData = NSData(contentsOfURL: url!)
      let image = UIImage(data: imageData!)
      
      NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        completionHandler(image!)
      })
    }
  }
  
}







