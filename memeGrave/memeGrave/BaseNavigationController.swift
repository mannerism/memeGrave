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
	let imageView: UIImageView = {
		let image = UIImage(named: "")
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		addViews()
		setConstraints()
	}
	// MARK: - Handlers
	func setup() {
		let scrollView = view.subviews[0]
		let contentView = scrollView.subviews[0]
		contentView.backgroundColor = .clear
		scrollView.backgroundColor = .white
	}

	func addViews() {
		view.addSubview(imageView)
	}

	func setConstraints() {
		imageViewConstraints()
	}

	// MARK: - Constraints
	func imageViewConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.widthAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
		imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
}
