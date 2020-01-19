//
//  RotaryBeaconLight.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/09/16.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation
import SwiftGifOrigin

/// パトランプ管理クラス
class RotaryBeaconLight {
  
  init () {
  }
  
  func getGifImage() -> UIImage? {
   return UIImage.gif(name: "RotaryBeaconLight")
  }
  
}
