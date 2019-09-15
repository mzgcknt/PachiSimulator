//
//  PachiSetting.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2019/08/20.
//  Copyright © 2019 溝口健太. All rights reserved.
//

import Foundation

class PachiSetting {
  private var probability: Int
  private var rotation: Int
  
  init() {
    self.probability = Constants.pachiSpec.middle.rawValue
    self.rotation = 20
  }
  
  func getProbability() -> Int {
    return self.probability
  }
  func setProbability(probability: Int) {
    self.probability = probability
  }
  
  func getRotation() -> Int {
    return self.rotation
  }
  func setRotation(rotation: Int) {
    self.rotation = rotation
  }
}
