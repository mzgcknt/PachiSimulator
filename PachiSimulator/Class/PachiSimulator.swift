//
//  PachiSimulator.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2020/01/26.
//  Copyright © 2020 溝口健太. All rights reserved.
//

import Foundation

/// 確率計算とその結果を管理するクラス
class PachiSimulator {
  private let simulateProbability: Int
  // 当選番号
  private let winNumber: Int
  
  init(probability: Int) {
    self.simulateProbability = probability
    self.winNumber = Int.random(in: 0 ..< self.simulateProbability)
  }
  /// 初回起動時のデフォルト設定
  init() {
    self.simulateProbability = Constants.shared.pachiSpec[0].denominator
    self.winNumber = Int.random(in: 0 ..< self.simulateProbability)
  }
  /// 指定された確率でのシミュレート処理
  func simulate(tryCount: Int) -> Bool {
    let randomNumber = Int.random(in: 0 ..< self.simulateProbability)
    return self.isWinNumber(randomNumber: randomNumber)
  }
  /// 当選チェック
  /// - Parameter randomNumber: 当たり番号
  private func isWinNumber(randomNumber: Int) -> Bool {
    return (self.winNumber == randomNumber)
  }
}
