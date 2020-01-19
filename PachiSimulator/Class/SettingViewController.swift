//
//  SettingViewController.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/18.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import UIKit

/// 確率と回転率の設定画面
class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var probabilityLabel: UILabel!
  @IBOutlet weak var rotationRateLabel: UILabel!
  
  @IBOutlet weak var probabilityPicker: UIPickerView!
  @IBOutlet weak var rotationRatePicker: UIPickerView!
  
  var rotationRate :[Int] = []
  // TODO:VCから受け取ったクラスの確率と回転率を再設定するようにする
  var pachiSetting: PachiSetting!
  var settingDelegate: PachiSettingDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.probabilityLabel.text = "確率"
    self.rotationRateLabel.text = "回転率"

    setPickerView(pickerView: probabilityPicker, tag: 1)
    setPickerView(pickerView: rotationRatePicker, tag: 2)
    }
    
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 1 {
      return Constants.shared.probability.count
    } else {
      return rotationRate.count
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // TODO: pickerが選ばれた際に、確率と回転率をsetするような処理をする事
    if pickerView.tag == 1 {
//      self.pachiSetting.Probability =  Constants.shared.probability[row].denominator
      self.settingDelegate?.reflectPachiProbability(probability: Constants.shared.probability[row].spec)
    } else {
//      self.pachiSetting.Rotation = rotationRate[row]
      self.settingDelegate?.reflectPachiRotationRate(rotationRate: String(rotationRate[row]))
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 1 {
      return Constants.shared.probability[row].spec
    } else {
      return rotationRate.map { String($0) }[row]
    }
  }
  /// 確率, 回転率のdataPickerの設定
  /// - Parameters:
  ///   - pickerView: dataPicker
  ///   - tag: dataPickerのタグ
  func setPickerView(pickerView: UIPickerView, tag: Int) {
    pickerView.delegate = self
    pickerView.dataSource = self
    pickerView.tag = tag
    if pickerView.tag == 2 {
      setRotationRateArray(begin: 10, end: 30)
    }
  }
  /// dataPickerへ回転率を反映
  /// - Parameters:
  ///   - begin: 最低
  ///   - end: 最高
  func setRotationRateArray(begin: Int, end: Int) {
    for index in begin ... end {
      self.rotationRate.append(index)
    }
  }
}
