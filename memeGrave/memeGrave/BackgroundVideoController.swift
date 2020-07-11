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

	lazy var loginButton: UIButton = {
		let button = UIButton(type: .system)
		let attrText = MemeGraveText.make("LOGIN", .bold, 20.adjustFontSize, .white)
		button.layer.cornerRadius = CGFloat(5.adjustHeight)
		button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
		button.setAttributedTitle(attrText, for: .normal)
		button.setBackgroundColor(color: .red, forState: .normal)
		return button
	}()

	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		playBackgroundVideo()
		view.backgroundColor = .black
		addViews()
		setConstraints()
	}

	func addViews() {
		view.addSubview(loginButton)
	}

	func setConstraints() {
		loginButtonConstraints()
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

	@objc func handleLoginButton() {
		print("handle Login button")
	}

	// MARK: - Handlers

	// MARK: - Constraints
	func loginButtonConstraints() {
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.widthAnchor.constraint(equalToConstant: CGFloat(200.adjustWidth)).isActive = true
		loginButton.heightAnchor.constraint(equalToConstant: CGFloat(50.adjustHeight)).isActive = true
		loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
}
