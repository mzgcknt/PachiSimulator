//
//  ViewController.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/17.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var navigationBar: UINavigationItem!
  
  var pachi = PachiSetting ()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.shared.settingSegue {
      let nc = segue.destination as! settingViewController
       nc.pachi = self.pachi
    }
  }
}

