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
  
  /// 初回起動時のデフォルト設定
  init() {
    self.probability = Constants.pachiSpec.middle.rawValue
    self.rotation = 20
  }
  
  /// 確率の取得
  ///
  /// - Returns: 確率
  func getProbability() -> Int {
    return self.probability
  }
  /// 確率の設定
  ///
  /// - Parameter probability: 設定する確率
  func setProbability(probability: Int) {
    self.probability = probability
  }
  /// 回転率の取得
  ///
  /// - Returns: 回転率
  func getRotation() -> Int {
    return self.rotation
  }
  /// 回転率の設定
  ///
  /// - Parameter rotation: 設定する回転率
  func setRotation(rotation: Int) {
    self.rotation = rotation
  }
}
