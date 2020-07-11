//
//  Extensions.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/11.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit

extension Double {
  var adjustHeight: Double {
    var adjusted: Double?
		if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first,
			 let viewController = window.rootViewController {
      let frame = viewController.view.frame
      adjusted = self * (Double(frame.height) / 768.0) //ipad 9.7-inch 13.1
    }
    return adjusted ?? 0
  }

  var adjustWidth: Double {
    var adjusted: Double?
		if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first,
			 let viewController = window.rootViewController {
      let frame = viewController.view.frame
      adjusted = self * (Double(frame.width) / 1024.0) //ipad 9.7-inch 13.1
    }
    return adjusted ?? 0
  }

  var adjustFontSize: Double {
    var adjusted = Double()
    if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first,
			 let viewController = window.rootViewController {
      let frame = viewController.view.frame
      adjusted = self * ((pow((Double(frame.width)), 2) + pow((Double(frame.height)), 2)) / (pow(768.0, 2) + pow(1024.0, 2)))
    }
    //set up minimum and maximum text size
    if adjusted < 14 {
      adjusted = 12
    } else if adjusted > self { //do not increase font size
      adjusted = self
    }

    //set up minimum and maximum adjustable range
    let ratio = adjusted / self
    if ratio < 0.8 {
      adjusted = self * 0.8
    } else if ratio > 1.15 { //do not increase font size
      adjusted = self * 1.15
    }

    return adjusted
  }
}
