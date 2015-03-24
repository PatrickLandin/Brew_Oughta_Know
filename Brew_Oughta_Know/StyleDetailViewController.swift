//
//  StyleDetailViewController.swift
//  Brew_Oughta_Know
//
//  Created by Patrick Landin on 3/19/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class StyleDetailViewController: UIViewController {

  @IBOutlet weak var styleNameLabel: UILabel!
  @IBOutlet weak var styleCategoryLabel: UILabel!
  @IBOutlet weak var abvMinLabel: UILabel!
  @IBOutlet weak var abvMaxLabel: UILabel!
  @IBOutlet weak var fgMinLabel: UILabel!
  @IBOutlet weak var fgMaxLabel: UILabel!
  @IBOutlet weak var ogMinLabel: UILabel!
  @IBOutlet weak var styleDescriptionLabel: UILabel!
  
  var style : [Style]?
  var selectedStyle : Style?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      println("Desc: \(self.selectedStyle!.styleDescription)")
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
