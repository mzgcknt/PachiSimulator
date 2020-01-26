//
//  InvestmentMoney.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2020/01/26.
//  Copyright © 2020 溝口健太. All rights reserved.
//

import Foundation

/// 投資金額の管理クラス
class InvestmentMoney {
  private var rotation: Int
  private var investmentMoney = 0
  var InvestmentMoney: Int {
    return self.investmentMoney
  }
  /// 初回起動時のデフォルト設定
  init() {
    self.rotation = 20
  }
  init(rotation: Int) {
    self.rotation = rotation
  }
  /// 追加投資
  /// - Parameter tryCount: 試行回数
  func addInvestment(tryCount: Int) {
    if self.isFillRotation(tryCount: tryCount) {
      self.investmentMoney += 1000
    }
  }
  /// 投資金の初期化
  func clear() {
    self.investmentMoney = 0
  }
  /// 現在の試行回数が平均回転数分回したか
  /// 本当は500円周期にしたかったが、計算処理が複雑になりそうなので諦めました。。
  /// - Parameter tryCount: 試行回数
  private func isFillRotation(tryCount: Int) -> Bool {
    // xは平均回転数の周期
    let x = tryCount/self.rotation
    // 次回追加投資タイミング = 平均回転数*x+1
    let nextInvestment = (self.rotation*x)+1
    return (nextInvestment == tryCount)
  }
}
