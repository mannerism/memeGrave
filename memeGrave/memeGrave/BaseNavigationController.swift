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
	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	// MARK: - Handlers
	func setup() {
		let scrollView = view.subviews[0]
		let contentView = scrollView.subviews[0]
		contentView.backgroundColor = .clear
		scrollView.backgroundColor = .red
	}
	// MARK: - Constraints
}
