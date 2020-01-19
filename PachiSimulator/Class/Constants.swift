//
//  Constants.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/21.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation

class Constants {
  static let shared = Constants()
  
  private init() {
  }
  
  let settingSegue = "toSettingView"
  let historySegue = "toHistoryView"
  
  enum pachiSpec: Int {
    case middle = 319
    case lightMiddle256 = 256
    case lightMiddle199 = 199
  }
  // 確率 [(表記用, 計算用)]
  let probability:[(spec: String, denominator: Int)] = [("1/319", 319), ("1/256", 256), ("1/199", 199)]
}
