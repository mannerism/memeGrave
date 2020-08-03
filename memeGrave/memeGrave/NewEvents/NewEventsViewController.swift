//
//  EventViewController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/27.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import SoftUIView

private let newEventsCellID = "newEventsCellID"
class NewEventsViewController: UIViewController {
	// MARK: - Properties
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.backgroundColor = .neuMorph
		view.delegate = self
		view.dataSource = self
		return view
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
		view.backgroundColor = .neuMorph
		collectionView.register(NewEventsCell.self, forCellWithReuseIdentifier: newEventsCellID)
	}

	func addViews() {
		view.addSubview(collectionView)
	}

	func setConstraints() {
		collectionViewConstraints()
	}
	// MARK: - Constraints
	func collectionViewConstraints() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
}

extension NewEventsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newEventsCellID, for: indexPath) as? NewEventsCell else {
			return UICollectionViewCell()
		}
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: view.frame.height/1.5)
	}
}
