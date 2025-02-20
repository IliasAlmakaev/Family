//
//  Extension + UIButton.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import UIKit


extension UIButton {
  func roundedAndBordered(withColor color: UIColor) {
    self.layer.cornerRadius = 19
    self.layer.borderWidth = 1
    self.layer.borderColor = color.cgColor
    self.setTitleColor(color, for: .normal)
    
    self.contentEdgeInsets = UIEdgeInsets(
      top: 10,
      left: 20,
      bottom: 10,
      right: 20
    )
  }
}
