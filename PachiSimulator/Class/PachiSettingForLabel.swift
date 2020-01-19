//
//  PachiSettingForLabel.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/09/15.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation

/// ラベル表示用テキスト文の管理クラス(今の所イケてないクラス)
class PachiSettingForLable: PachiSetting {
  private var probabilityText: String?
  private var rotationText: String?
  /// 確率表記用のテキスト文
  var ProbabilityText: String? {
    get {
      return String(Probability)
    }
    set(Probability) {
      self.probabilityText = Probability
    }
  }
  /// 回転率表記用のテキスト文
  var RotationText: String? {
    get {
      return String(Rotation)
    }
    set(RotationText) {
      self.probabilityText = rotationText
    }
  }
  
  override init() {
    super.init()
  }
  
  
}
