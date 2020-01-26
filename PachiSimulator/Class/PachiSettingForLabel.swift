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
  private var spec: String
  private var rotationText: String?
  private let defaultRotation = 20
  // 回転率が20スタートのため、要素は10番目になる
  private let defaultSelectRotation = 10
  /// パチンコのスペック
  var Spec: String {
    get {
      return self.spec
    }
    set(spec) {
      self.spec = spec
    }
  }
  /// 回転率表記用のテキスト文
  var RotationText: String? {
    get {
      return String(super.Rotation)
    }
    set(RotationText) {
      self.rotationText = RotationText
    }
  }
  
  init() {
    self.spec = Constants.shared.pachiSpec[0]
    super.init(rotation: self.defaultRotation, selectRotation: self.defaultSelectRotation)
  }
}
