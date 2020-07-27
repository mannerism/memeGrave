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
import CBFlashyTabBarController

class MainViewController: UIViewController {
	// MARK: - Properties
	var authViewController: AuthViewController!
	var newEventsViewController: NewEventsViewController!
	var bestEventsViewController: BestEventsViewController!
	var settingsViewController: SettingsViewController!
	var cubertoTabBar: CBFlashyTabBarController!

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		configureAuthController()
		configureNavigationController()
		configureNewEventsController()
		configureBestEventsViewController()
		configureSettingsViewController()
		configureCubertoTabBar()
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
		navigationController?.navigationBar.isTranslucent = true
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(handleLogoutButton))
	}

	func configureNewEventsController() {
		if newEventsViewController == nil {
			newEventsViewController = NewEventsViewController()
			newEventsViewController.tabBarItem = UITabBarItem(title: "New", image: #imageLiteral(resourceName: "Events"), tag: 0)
		}
	}

	func configureBestEventsViewController() {
		if bestEventsViewController == nil {
			bestEventsViewController = BestEventsViewController()
			bestEventsViewController.tabBarItem = UITabBarItem(title: "Best", image: #imageLiteral(resourceName: "Highlights"), tag: 0)
		}
	}

	func configureSettingsViewController() {
		if settingsViewController == nil {
			settingsViewController = SettingsViewController()
			settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "Settings"), tag: 0)
		}
	}

	func configureCubertoTabBar() {
		if tabBarController == nil {
			CBFlashyTabBar.appearance().tintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.431372549, alpha: 1)
			cubertoTabBar = CBFlashyTabBarController()
			addChild(cubertoTabBar)
			view.addSubview(cubertoTabBar.view)
			cubertoTabBarConstraints()
			cubertoTabBar.viewControllers = [newEventsViewController, bestEventsViewController, settingsViewController]
		}
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
	func cubertoTabBarConstraints() {
		cubertoTabBar.view.translatesAutoresizingMaskIntoConstraints = false
		cubertoTabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		cubertoTabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		cubertoTabBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		cubertoTabBar.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
	}
}

extension MainViewController: FUIAuthDelegate {
	func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
		dismiss(animated: true, completion: nil)
	}
}
