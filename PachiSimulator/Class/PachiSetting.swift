//
//  PachiSetting.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/20.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation

/// 確率および回転率を扱うクラス
class PachiSetting {
  private var probability: Int
  private var rotation: Int
  
  private var selectProbabilityPicker: Int
  private var selectRotationPicker: Int
  
  /// 初回起動時のデフォルト設定
  init(rotation: Int, selectRotation: Int) {
    self.probability = Constants.ProbabilityDenominator.middle.rawValue
    self.rotation = rotation
    self.selectProbabilityPicker = 0
    self.selectRotationPicker = selectRotation
  }
  /// 確率の設定
  ///
  /// - Returns: 確率
  var Probability: Int {
    get {
      return self.probability
    }
    set(probabality) {
      self.probability = probabality
    }
  }
  /// 回転率の設定
  ///
  /// - Returns: 回転率
  var Rotation: Int {
    get {
      return self.rotation
    }
    set(rotation) {
      self.rotation = rotation
    }
  }
  /// 選択中の確率
  var SelectProbability: Int {
    get {
      return self.selectProbabilityPicker
    }
    set(selectProbability) {
      self.selectProbabilityPicker = selectProbability
    }
  }
  /// 選択中の回転率
  var SelectRotation: Int {
    get {
      return self.selectRotationPicker
    }
    set(selectRotation) {
      self.selectRotationPicker = selectRotation
    }
  }
}
