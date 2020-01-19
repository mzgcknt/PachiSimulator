//
//  settingViewController.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/18.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import UIKit

/// 確率と回転率の設定画面
class settingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var probabilityLabel: UILabel!
  @IBOutlet weak var rotationRateLabel: UILabel!
  
  @IBOutlet weak var probabilityPicker: UIPickerView!
  @IBOutlet weak var rotationRatePicker: UIPickerView!
  
  var rotationRate :[Int] = []
  
  var pachi:  PachiSetting!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        probabilityLabel.text = "確率"
        rotationRateLabel.text = "回転率"
    
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
    // ここはドラムロールだから、画面を遷移する時に値をセットする感じにしよ。
    if pickerView.tag == 1 {
      self.pachi.setProbability(probability: Constants.shared.probability[row].denominator)
    } else {
      self.pachi.setRotation(rotation: rotationRate[row])
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 1 {
      return Constants.shared.probability[row].spec
    } else {
      return rotationRate.map { String($0) }[row]
    }
  }
  func setPickerView(pickerView: UIPickerView, tag: Int) {
    pickerView.delegate = self
    pickerView.dataSource = self
    pickerView.tag = tag
    if pickerView.tag == 2 {
      setRotationRateArray(begin: 10, end: 30)
    }
  }
  
  func setRotationRateArray(begin: Int, end: Int) {
    for index in begin ... end {
      self.rotationRate.append(index)
    }
  }
}
