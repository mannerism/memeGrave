//
//  MainViewController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/06/22.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

class MainViewController: UINavigationController {
	// MARK: - Properties
	var authViewController: AuthViewController!

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		configureAuthController()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		showAuthController()
	}

	// MARK: - Handlers
	func setup() {
		view.backgroundColor = .white
	}

	func configureAuthController() {
		let authUI = FUIAuth.defaultAuthUI()
		authUI?.delegate = self
		let providers: [FUIAuthProvider] = [
			FUIGoogleAuth()
		]
		authUI?.providers = providers
		authViewController = AuthViewController(authUI: authUI!)
	}

	@objc func showAuthController() {
		authViewController.modalPresentationStyle = .fullScreen
		present(authViewController, animated: false, completion: nil)
	}
	// MARK: - Constraints
}

extension MainViewController: FUIAuthDelegate {
	func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
		dismiss(animated: true, completion: nil)
	}
}
