//
//  RotaryBeaconLight.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/09/16.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation
import SwiftGifOrigin

/// 表示するパトランプを管理するクラス
class RotaryBeaconLight {
  
  init () {
  }
  
  func getGifImage() -> UIImage? {
   return UIImage.gif(name: "RotaryBeaconLight")
  }
  
}
