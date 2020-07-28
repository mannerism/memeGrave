//
//  BestEventsViewController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/27.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class BestEventsViewController: ASDKViewController<ASDisplayNode> {
	// MARK: - Properties
	// MARK: - Init
	override init() {
		super.init(node: ASDisplayNode())
		self.node.backgroundColor = .brown
	}

	required init?(coder: NSCoder) {
		return nil
	}
	// MARK: - Handlers
	// MARK: - Constraints
}
