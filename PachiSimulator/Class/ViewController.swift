//
//  ViewController.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/17.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class ViewController: UIViewController {
  
  @IBOutlet weak var navigationBar: UINavigationItem!
  @IBOutlet weak var RotaryBeaconLightView: UIImageView!
  @IBOutlet weak var probabilityLabel: UILabel!
  @IBOutlet weak var rotationLabel: UILabel!
  
  var pachi = PachiSettingForLable ()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
//    RotaryBeaconLightView.loadGif(name: "RotaryBeaconLightView")
//    do {
//      let imageData = try Data(contentsOf: Bundle.main.url(forResource: "RotaryBeaconLight", withExtension: "gif")!)
//      self.RotaryBeaconLightView.image = UIImage.gif(data: imageData)
//    } catch {
//      print(error)
//    }
    self.RotaryBeaconLightView.image = RotaryBeaconLight().getGifImage()

  }
  /// 確率および回転率を変更した際にラベルへ反映させる用に呼び出す
  override func viewWillAppear(_ animated: Bool) {
    probabilityLabel.text = pachi.probabilityText
    rotationLabel.text = pachi.rotationText
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.shared.settingSegue {
      let nc = segue.destination as! settingViewController
       nc.pachi = self.pachi
    }
  }
}

