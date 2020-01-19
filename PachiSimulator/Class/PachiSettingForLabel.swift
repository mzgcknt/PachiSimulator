//
//  PachiSettingForLabel.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/09/15.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation

/// ラベルに表示用のテキスト文の管理クラス
class PachiSettingForLable: PachiSetting {
  
  /// 確率表記用のテキスト文
  var probabilityText: String? {
    return String(getProbability())
  }
  /// 回転率表記用のテキスト文
  var rotationText: String? {
    return String(getRotation())
  }
  
  override init() {
    super.init()
  }
  
  
}
