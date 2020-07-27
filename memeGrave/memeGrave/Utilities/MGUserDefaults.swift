//
//  MGUserDefaults.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/26.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import Foundation

class MGUserDefaults {
	// MARK: - Setters
	static func setIsLoggedIn(_ isLoggedIn: Bool) {
		UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
		sync()
	}

	// MARK: - Getters
	static func getIsLoggedIn() -> Bool {
		return UserDefaults.standard.bool(forKey: "isLoggedIn")
	}

	// MARK: - Removers
	static func removeIsLoggedIn() {
		UserDefaults.standard.removeObject(forKey: "isLoggedIn")
	}

	// MARK: - Application
	static func removeAllHitItStoreUserDefaults() {
		removeIsLoggedIn()
	}

	// MARK: - Sync
	private static func sync() {
		UserDefaults.standard.synchronize()
	}
}
