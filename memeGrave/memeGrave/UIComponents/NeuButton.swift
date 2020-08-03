//
//  NeuButton.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/08/03.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import SoftUIView

class NeuButton: SoftUIView {
	// MARK: - Properties
	let textLabel: UILabel = {
		let label = UILabel()
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.5
		label.textAlignment = .center
		return label
	}()

	// MARK: - Init
	convenience init(text: String, fontStyle: FontStyle, size: Double, color: UIColor) {
		self.init()
		textLabel.attributedText = MemeGraveText.make(text, fontStyle, size, color)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
		addViews()
		setConstraints()
	}

	required init?(coder: NSCoder) {
		return nil
	}

	// MARK: - Handlers
	func setup() {

	}

	func addViews() {
		addSubview(textLabel)
	}

	func setConstraints() {
		textLabelConstraints()
	}

	// MARK: - Constraints
	func textLabelConstraints() {
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		textLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
	}
}
