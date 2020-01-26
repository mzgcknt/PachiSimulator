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
  @IBOutlet weak var investmentLabel: UILabel!
  
  private var pachiSetting = PachiSettingForLable()
  // 初回起動時の試行回数 TODO:クラス化の検討
  private var tryCount = 0
  
  private var simulator: PachiSimulator!
  private var investmentMoney: InvestmentMoney!
  
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
    self.simulator = PachiSimulator()
    self.investmentMoney = InvestmentMoney()
    
    self.navigationBar.title = pachiSetting.Spec
    self.rotationLabel.text = "回転率 \(pachiSetting.RotationText!)"
    self.investmentLabel.text = "\(self.investmentMoney.InvestmentMoney) 円投資"
  }
  /// 設定画面の確率を反映させる
  /// - Parameter probability: 確率
  func reflectPachiProbability(probability: (spec:String, denominator:Int)) {
    self.clearSpecLabel(spec: probability.spec)
    // ココいらないかもしれん
    self.pachiSetting.Probability = probability.denominator
    self.simulator = PachiSimulator(probability: probability.denominator)
    self.clearTryCount()
    self.clearInvestmentLabel()
  }
  /// 設定画面の回転率を反映させる
  /// - Parameter rotationRate: 回転率
  func reflectPachiRotationRate(rotationRate: Int) {
    self.pachiSetting.Rotation = rotationRate
    self.rotationLabel.text = "回転率 \(rotationRate)"
    self.clearTryCount()
    self.clearInvestmentLabel()
    self.investmentMoney = InvestmentMoney(rotation: rotationRate)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == Constants.Segue.settingSegue.rawValue {
      let settingViewController = segue.destination as! SettingViewController
       settingViewController.pachiSetting = self.pachiSetting
       settingViewController.settingDelegate = self
    }
  }
  /// 確率表示のクリア処理
  /// - Parameter spec: 設定した確率
  private func clearSpecLabel(spec: String) {
    self.pachiSetting.Spec = spec
    self.navigationBar.title = spec
  }
  /// 試行回数のクリア処理
  private func clearTryCount() {
    self.tryCount = 0
    self.probabilityLabel.text = "\(self.tryCount)回転"
  }
  /// 投資金額のクリア処理
  private func clearInvestmentLabel() {
    self.investmentMoney.clear()
    self.investmentLabel.text = "\(self.investmentMoney.InvestmentMoney) 円投資"
  }
  /// 試行回数
  /// - Parameter sender: ボタン
  @IBAction func trial(_ sender: Any) {
    self.tryCount += 1
    if self.simulator.simulate(tryCount: self.tryCount) {
      print("当たった")
      // TODO: 当たったらパトランプの表示をする
    }
    self.investmentMoney.addInvestment(tryCount: self.tryCount)
    self.probabilityLabel.text = "\(self.tryCount)回転"
    self.investmentLabel.text = "\(self.investmentMoney.InvestmentMoney) 円投資"
  }
}
