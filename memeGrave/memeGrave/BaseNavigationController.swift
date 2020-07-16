//
//  BaseNavigationController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/06/23.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import FirebaseUI

class BaseNavigationController: FUIAuthPickerViewController {
	// MARK: - Properties
	var scrollView: UIScrollView!
	var contentView: UIView!
	var tap: UITapGestureRecognizer!
	var backgroundVideoController: BackgroundVideoController!
	var loginController: LoginController!

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		addViews()
		setConstraints()
		configureBackgroundVideoController()
		configureLoginController()
		configureTapGestureRecognizer()
	}

	// MARK: - Handlers
	func setup() {
		scrollView = view.subviews[0] as? UIScrollView
		contentView = scrollView.subviews[0]
		contentView.backgroundColor = .clear
		scrollView.backgroundColor = .black
		scrollView?.delaysContentTouches = false
	}

	func addViews() {
	}

	func setConstraints() {
	}

	func configureBackgroundVideoController() {
		if backgroundVideoController == nil {
			backgroundVideoController = BackgroundVideoController()
			addChild(backgroundVideoController)
			scrollView.insertSubview(backgroundVideoController.view, at: 0)
			backgroundVideoControllerConstraints()
		}
	}

	func configureLoginController() {
		if loginController == nil {
			loginController = LoginController()
			addChild(loginController)
			scrollView.addSubview(loginController.view)
			loginControllerConstraints()
		}
	}

	func configureTapGestureRecognizer() {
		tap = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
		scrollView.addGestureRecognizer(tap)
	}

	@objc func handleBackgroundTap() {
		view.endEditing(true)
	}

	// MARK: - Constraints
	func backgroundVideoControllerConstraints() {
		backgroundVideoController.view.translatesAutoresizingMaskIntoConstraints = false
		backgroundVideoController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		backgroundVideoController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		backgroundVideoController.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		backgroundVideoController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
	}

	func loginControllerConstraints() {
		loginController.view.translatesAutoresizingMaskIntoConstraints = false
		loginController.view.leadingAnchor.constraint(equalTo: (contentView.subviews.first?.leadingAnchor)!).isActive = true
		loginController.view.trailingAnchor.constraint(equalTo: (contentView.subviews.first?.trailingAnchor)!).isActive = true
		loginController.view.heightAnchor.constraint(equalToConstant: CGFloat(600.adjH)).isActive = true
		loginController.view.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -CGFloat(10.adjH)).isActive = true
	}
}
