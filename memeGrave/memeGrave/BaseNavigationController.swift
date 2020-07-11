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
		let image = UIImage(named: "Main_Background_Image")
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .purple
		return imageView
	}()

	var scrollView: UIView!
	var contentView: UIView!
	var backgroundViedeoController: BackgroundVideoController!

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		addViews()
		setConstraints()
		configureBackgroundVideoController()
	}

	// MARK: - Handlers
	func setup() {
		scrollView = view.subviews[0]
		contentView = scrollView.subviews[0]
		contentView.backgroundColor = .clear
		scrollView.backgroundColor = .clear
	}

	func addViews() {
	}

	func setConstraints() {
	}

	func configureBackgroundVideoController() {
		if backgroundViedeoController == nil {
			backgroundViedeoController = BackgroundVideoController()
			addChild(backgroundViedeoController)
			scrollView.insertSubview(backgroundViedeoController.view, at: 0)
			backgroundViedeoControllerConstraints()
		}
	}

	// MARK: - Constraints
	func imageViewConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}

	func backgroundViedeoControllerConstraints() {
		backgroundViedeoController.view.translatesAutoresizingMaskIntoConstraints = false
		backgroundViedeoController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		backgroundViedeoController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		backgroundViedeoController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		backgroundViedeoController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
}
