//
//  NewEventsCell.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/08/03.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import SoftUIView

class NewEventsCell: UICollectionViewCell {
	// MARK: - Properties
	let neuView = SoftUIView()

	// MARK: - Init
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
		backgroundColor = .neuMorph
	}

	func addViews() {
		addSubview(neuView)
	}

	func setConstraints() {
		neuViewConstraints()
	}

	// MARK: - Constraints
	func neuViewConstraints() {
		neuView.translatesAutoresizingMaskIntoConstraints = false
		neuView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(10.adjW)).isActive = true
		neuView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(10.adjW)).isActive = true
		neuView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(10.adjH)).isActive = true
		neuView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat(10.adjH)).isActive = true
	}
}
