//
//  BackgroundVideoController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/11.
//  Copyright © 2020 memeGrave. All rights reserved.
//

import UIKit
import AVFoundation

class BackgroundVideoController: UIViewController {
	// MARK: - Properties
	var player: AVPlayer?

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		playBackgroundVideo()
		view.backgroundColor = .black
		addViews()
		setConstraints()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		player?.play()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		player?.pause()
	}

	deinit {
		print("deinit video controller")
	}

	func addViews() {
	}

	func setConstraints() {
	}

	func playBackgroundVideo() {
		let path = Bundle.main.path(forResource: "Main_Background_Video", ofType: ".mp4")
		player = AVPlayer(url: URL(fileURLWithPath: path!))
		player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
		let playerLayer = AVPlayerLayer(player: player)
		playerLayer.frame = self.view.frame
		playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
		self.view.layer.insertSublayer(playerLayer, at: 0)
		NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
		player!.seek(to: CMTime.zero)
		player!.play()
		self.player?.isMuted = true
	}

	@objc func playerItemDidReachEnd() {
		player!.seek(to: CMTime.zero)
	}
	// MARK: - Handlers
	// MARK: - Constraints
}
