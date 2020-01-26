//
//  PachiSettingDelegate.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2020/01/19.
//  Copyright © 2020 溝口健太. All rights reserved.
//

import Foundation

/// 選択した設定内容を反映させるdelegate
protocol PachiSettingDelegate: class {
  func reflectPachiProbability(probability: (spec:String, denominator:Int))
  func reflectPachiRotationRate(rotationRate: Int)
}
