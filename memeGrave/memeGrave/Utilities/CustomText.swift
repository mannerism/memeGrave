//
//  CustomText.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/11.
//  Copyright © 2020 memeGrave. All rights reserved.
//x

import UIKit

enum FontStyle: String {
	case regular = "NotoSansKannada-Regular"
	case bold = "NotoSansKannada-Bold"
	case light = "NotoSansKannada-Light"
}

class MemeGraveText {
	static func make(_ text: String, _ style: FontStyle, _ size: Double, _ color: UIColor) -> NSMutableAttributedString {
		switch style {
		case .regular:
			let font = UIFont(name: FontStyle.regular.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .regular), NSAttributedString.Key.foregroundColor: color]
			return NSMutableAttributedString(string: text, attributes: attributes)

		case .bold:
			let font = UIFont(name: FontStyle.bold.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .bold), NSAttributedString.Key.foregroundColor: color]
			return NSMutableAttributedString(string: text, attributes: attributes)

		case .light:
			let font = UIFont(name: FontStyle.light.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .light), NSAttributedString.Key.foregroundColor: color]
			return NSMutableAttributedString(string: text, attributes: attributes)
		}
	}

	static func attributes(_ style: FontStyle, _ size: Double, _ color: UIColor) -> [NSAttributedString.Key: Any] {
		switch style {
		case .regular:
			let font = UIFont(name: FontStyle.regular.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .regular), NSAttributedString.Key.foregroundColor: color]
			return attributes

		case .bold:
			let font = UIFont(name: FontStyle.bold.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .bold), NSAttributedString.Key.foregroundColor: color]
			return attributes

		case .light:
			let font = UIFont(name: FontStyle.light.rawValue, size: CGFloat(size.adjF))
			let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: CGFloat(size.adjF), weight: .light), NSAttributedString.Key.foregroundColor: color]
			return attributes
		}
	}
}
