//
//  Utilities.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/11.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import Foundation

class Utilities {
	static func isPasswordValid(_ password: String) -> Bool {
		let passwordText = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&^])(A-Za-z\\d$@$#!%*?&]{8,})")
		return passwordText.evaluate(with: password)
	}
}
