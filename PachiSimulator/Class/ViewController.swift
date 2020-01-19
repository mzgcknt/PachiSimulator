//
//  ViewController.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/17.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class ViewController: UIViewController, PachiSettingDelegate {
  
  @IBOutlet weak var navigationBar: UINavigationItem!
  @IBOutlet weak var RotaryBeaconLightView: UIImageView!
  @IBOutlet weak var probabilityLabel: UILabel!
  @IBOutlet weak var rotationLabel: UILabel!
  
  private var pachiSetting = PachiSettingForLable()
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    RotaryBeaconLightView.loadGif(name: "RotaryBeaconLightView")
//    do {
//      let imageData = try Data(contentsOf: Bundle.main.url(forResource: "RotaryBeaconLight", withExtension: "gif")!)
//      self.RotaryBeaconLightView.image = UIImage.gif(data: imageData)
//    } catch {
//      print(error)
//    }
    // TODO:gifの読み込みが遅いので、メインスレッドでやらないようにした方が良いかも
//    self.RotaryBeaconLightView.image = RotaryBeaconLight().getGifImage()
    self.probabilityLabel.text = pachiSetting.ProbabilityText
    self.rotationLabel.text = pachiSetting.RotationText
    
  }
  /// 設定画面の確率を反映させる
  /// - Parameter probability: 確率
  func reflectPachiProbability(probability: String?) {
    self.probabilityLabel.text = probability
  }
  /// 設定画面の回転率を反映させる
  /// - Parameter rotationRate: 回転率
  func reflectPachiRotationRate(rotationRate: String?) {
    self.rotationLabel.text = rotationRate
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == Constants.Segue.settingSegue.rawValue {
      let settingViewController = segue.destination as! SettingViewController
       settingViewController.pachiSetting = self.pachiSetting
       settingViewController.settingDelegate = self
    }
  }
}

