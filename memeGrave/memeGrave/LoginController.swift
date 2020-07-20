//
//  LoginController.swift
//  memeGrave
//
//  Created by Yu Juno on 2020/07/16.
//  Copyright © 2020 memeGrave. All rights reserved.
//
import UIKit
import FirebaseAuth
import Firebase

class LoginController: UIViewController {
	// MARK: - Properties
	lazy var loginButton: UIButton = {
		let button = UIButton(type: .system)
		let attrText = MemeGraveText.make("Sign up with Email", .bold, 13.adjF, .pantone)
		button.layer.cornerRadius = CGFloat(5.adjH)
		button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
		button.setAttributedTitle(attrText, for: .normal)
		button.layer.borderWidth = 2
		button.layer.borderColor = UIColor.pantone.cgColor
		return button
	}()

	let emailTextField: LeftPaddedTextField = {
		let textF = LeftPaddedTextField()
		textF.layer.borderWidth = 2
		textF.layer.cornerRadius = CGFloat(5.adjH)
		textF.layer.borderColor = UIColor.pantone.cgColor
		textF.textContentType = .emailAddress
		textF.autocapitalizationType = .none
		textF.attributedPlaceholder = MemeGraveText.make("Enter email", .bold, 13.adjF, .pantone)
		textF.defaultTextAttributes = MemeGraveText.attributes(.bold, 13.adjF, .pantone)
		return textF
	}()

	let passwordTextField: LeftPaddedTextField = {
		let textF = LeftPaddedTextField()
		textF.layer.borderWidth = 2
		textF.layer.cornerRadius = CGFloat(5.adjH)
		textF.layer.borderColor = UIColor.pantone.cgColor
		textF.attributedPlaceholder = MemeGraveText.make("Enter password", .bold, 13.adjF, .pantone)
		textF.textContentType = .password
		textF.autocapitalizationType = .none
		textF.isSecureTextEntry = true
		textF.defaultTextAttributes = MemeGraveText.attributes(.bold, 13.adjF, .pantone)
		return textF
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
		view.backgroundColor = .clear
	}

	func addViews() {
		view.addSubview(loginButton)
		view.addSubview(emailTextField)
		view.addSubview(passwordTextField)
	}

	func setConstraints() {
		loginButtonConstraints()
		emailTextFieldConstraints()
		passwordTextFieldConstraints()
	}

	@objc func handleLoginButton() {
		print("handle Login button")
		guard let email = emailTextField.text,
			let password = passwordTextField.text else {return}
		signIn(email: email, password: password)
	}

	private func signIn(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { [weak self] (_, error) in
			guard let strongSelf = self else {return}
			if error != nil {
				strongSelf.handleSignInError(error, email: email, password: password)
			} else {
				strongSelf.dismiss(animated: true, completion: nil)
			}
		}
	}

	private func createUser(email: String, password: String) {
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
			guard let strongSelf = self else {return}
			if error != nil {
				print(error!)
			} else {
				//어 성공이야
				let dataBase = Firestore.firestore()
				dataBase.collection("users").addDocument(data: [
					"email": email,
					"uid": result!.user.uid
				]) { (error) in
					if error != nil {
						// show error message
					} else {
						strongSelf.dismiss(animated: true, completion: nil)
					}
				}
			}
		}
	}

	private func handleSignInError(_ error: Error?, email: String, password: String) {
		guard let error = error else {return}
		if let errorCode = AuthErrorCode(rawValue: error._code),
			errorCode == .userNotFound {
			createUser(email: email, password: password)
		}
	}

	// MARK: - Constraints
	func loginButtonConstraints() {
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		loginButton.heightAnchor.constraint(equalToConstant: CGFloat(40.adjH)).isActive = true
	}

	func emailTextFieldConstraints() {
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -CGFloat(10.adjH)).isActive = true
		emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(40.adjH)).isActive = true
	}

	func passwordTextFieldConstraints() {
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -CGFloat(10.adjH)).isActive = true
		passwordTextField.heightAnchor.constraint(equalToConstant: CGFloat(40.adjH)).isActive = true
	}
}
