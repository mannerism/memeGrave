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

class MainViewController: UIViewController {
	// MARK: - Properties
	var authViewController: AuthViewController!

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		configureAuthController()
		configureNavigationController()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		perform(#selector(showAuthController), with: nil, afterDelay: 0.1)
	}

	// MARK: - Handlers
	func setup() {
		view.backgroundColor = .red
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

	func configureNavigationController() {
		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.barTintColor = .darkGray
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(handleLogoutButton))
	}

	@objc func addTapped() {
		showAuthController()
	}

	@objc func handleLogoutButton() {
		MGUserDefaults.setIsLoggedIn(false)
		showAuthController()
	}

	@objc func showAuthController() {
		guard !MGUserDefaults.getIsLoggedIn() else {return}
		authViewController.modalPresentationStyle = .fullScreen
		present(authViewController, animated: true, completion: nil)
	}
	// MARK: - Constraints
}

extension MainViewController: FUIAuthDelegate {
	func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
		dismiss(animated: true, completion: nil)
	}
}
