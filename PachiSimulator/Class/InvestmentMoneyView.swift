//
//  InvestmentMoneyView.swift
//  PachiSimulator
//
//  Created by 溝口健太 on 2020/01/27.
//  Copyright © 2020 溝口健太. All rights reserved.
//

import UIKit

/// 諭吉と野口ラベルをまとめたクラス
class InvestmentMoneyView: UIView {

  @IBOutlet weak var noguchiImage: UIImageView!
  @IBOutlet weak var noguchiCountLabel: UILabel!
  @IBOutlet weak var yukichiImage: UIImageView!
  @IBOutlet weak var yukichiCountLabel: UILabel!
 
  override init(frame: CGRect) {
      super.init(frame: frame)
      loadNib()
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      loadNib()
  }
  func loadNib() {
    if let view = Bundle.main.loadNibNamed("InvestmentMoneyView", owner: self, options: nil)?.first as? UIView {
      view.frame = self.bounds
      self.addSubview(view)
    }
  }
  private func clearCount() -> Int {
    return 0
  }
  /// 諭吉と野口のクリア処理(x用にLabelを設置するのが面倒なのでまとめた)
  func clearCountLabel() {
    self.yukichiCountLabel.text = "x\(clearCount())"
    self.noguchiCountLabel.text = "x\(clearCount())"
  }
}
