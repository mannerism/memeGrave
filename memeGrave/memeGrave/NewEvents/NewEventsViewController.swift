//
//  EventViewController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/27.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NewEventsViewController: ASDKViewController<ASDisplayNode> {
	// MARK: - Properties
	// MARK: - Init
	override init() {
		super.init(node: ASDisplayNode())
		node.backgroundColor = .purple
	}

	required init?(coder: NSCoder) {
		return nil
	}

	// MARK: - Handlers
	// MARK: - Constraints
}
