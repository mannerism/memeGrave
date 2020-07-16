//
//  LeftPaddedTextField.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/16.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit

class LeftPaddedTextField: UITextField {
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + CGFloat(15.adjW), y: bounds.origin.y, width: bounds.width - CGFloat(15.adjW), height: bounds.height)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + CGFloat(15.adjW), y: bounds.origin.y, width: bounds.width - CGFloat(15.adjW), height: bounds.height)
  }
}
