//
//  Extensions.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/11.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import Firebase

extension Double {
	var adjH: CGFloat {
		var adjusted = Double()
		let frame = UIWindow().screen.bounds
		adjusted = self * (Double(frame.height) / 812.0)

		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.7 {
			adjusted = self * 0.7
		} else if ratio > 1.4 {
			adjusted = self * 1.4
		}
		return CGFloat(adjusted)
	}

	var adjW: CGFloat {
		var adjusted = Double()
		let frame = UIWindow().screen.bounds
		adjusted = self * (Double(frame.width) / 375.0)

		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.7 {
			adjusted = self * 0.7
		} else if ratio > 1.4 {
			adjusted = self * 1.4
		}
		return CGFloat(adjusted)
	}

	var adjF: Double {
		var adjusted: Double!
		let frame = UIWindow().screen.bounds
		adjusted = self * ((pow((Double(frame.width)), 2) + pow((Double(frame.height)), 2)) / (pow(812.0, 2) + pow(375.0, 2)))

		//set up minimum and maximum text size
		if adjusted < 14 {
			adjusted = 14
		} else if adjusted > self { //do not increase font size
			adjusted = self
		}

		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.9 {
			adjusted = self * 0.9
		} else if ratio > 1 { //do not increase font size
			adjusted = self * 1
		}
		return adjusted
	}
}

extension UIButton {
	func setBackgroundColor(color: UIColor, forState: UIControl.State) {
		self.clipsToBounds = true  // add this to maintain corner radius
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		if let context = UIGraphicsGetCurrentContext() {
			context.setFillColor(color.cgColor)
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
			let colorImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			self.setBackgroundImage(colorImage, for: forState)
		}
	}
}
