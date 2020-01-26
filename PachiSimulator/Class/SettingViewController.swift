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
  var pachiSetting: PachiSetting!
  var settingDelegate: PachiSettingDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.probabilityLabel.text = "確率"
    self.rotationRateLabel.text = "回転率"
    self.setPickerView(pickerView: probabilityPicker)
    self.setPickerView(pickerView: rotationRatePicker)
  }
    
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  /// ピッカーの判定
  /// - Parameter tag: ピッカーで指定しているタグ番号
  private func isProbabilityPicker(tag: Int) -> Bool {
    return (tag == 1)
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if self.isProbabilityPicker(tag: pickerView.tag) {
      return Constants.shared.pachiSpec.count
    } else {
      return rotationRate.count
    }
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if self.isProbabilityPicker(tag: pickerView.tag) {
      self.pachiSetting.SelectProbability = row
      self.settingDelegate?.reflectPachiProbability(probability: Constants.shared.pachiSpec[row])
    } else {
      self.pachiSetting.SelectRotation = row
      self.settingDelegate?.reflectPachiRotationRate(rotationRate: rotationRate[row])
    }
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if self.isProbabilityPicker(tag: pickerView.tag) {
      return Constants.shared.pachiSpec[row].spec
    } else {
      return rotationRate.map { String($0) }[row]
    }
  }
  /// 確率, 回転率のdataPickerの設定
  /// - Parameters:
  ///   - pickerView: dataPicker
  ///   - tag: dataPickerのタグ
  private func setPickerView(pickerView: UIPickerView) {
    pickerView.delegate = self
    pickerView.dataSource = self
    if self.isProbabilityPicker(tag: pickerView.tag) {
      pickerView.selectRow(self.pachiSetting.SelectProbability, inComponent: 0, animated: true)
    } else {
      setRotationRateArray(begin: 10, end: 30)
      pickerView.selectRow(self.pachiSetting.SelectRotation, inComponent: 0, animated: true)
    }
  }
  /// dataPickerへ回転率を反映
  /// - Parameters:
  ///   - begin: 最低
  ///   - end: 最高
  private func setRotationRateArray(begin: Int, end: Int) {
    for index in begin ... end {
      self.rotationRate.append(index)
    }
  }
}
