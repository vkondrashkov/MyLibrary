//
//  AuthorizationViewController.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/1/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol AuthorizationView: class {
    func submitButtonDidPressed(sender: UIButton)
}

class AuthorizationViewController: UIViewController, AuthorizationView {
    var presenter: AuthorizationPresenter!
    
    private var authorizationView = UIView(frame: .zero)
    private var gradientLayer = CAGradientLayer()
    private var containerView = UIView(frame: .zero)
    private var loginLabel = UILabel()
    private var usernameField = UITextField(frame: .zero)
    private var passwordField = UITextField(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    
    override func loadView() {
        authorizationView.backgroundColor = .clear
        let colorTop = UIColor(red: 41.0 / 255.0, green: 128.0 / 255.0, blue: 185.0 / 255.0, alpha: 1).cgColor
        let colorBottom = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        authorizationView.layer.insertSublayer(gradientLayer, at: 0)
        
        loginLabel.text = "Login"
        loginLabel.textColor = .white
        loginLabel.font = .boldSystemFont(ofSize: 24)
        loginLabel.textAlignment = .center
        containerView.addSubview(loginLabel)
        activateLoginLabelConstraints(view: loginLabel)
        
        usernameField.placeholder = "Username or email"
        usernameField.font = .boldSystemFont(ofSize: 17)
        usernameField.borderStyle = .roundedRect
        usernameField.autocorrectionType = .no
        usernameField.keyboardType = .emailAddress
        usernameField.clearButtonMode = .whileEditing
        usernameField.contentVerticalAlignment = .center
        containerView.addSubview(usernameField)
        activateUsernameFieldConstraints(view: usernameField, anchorView: loginLabel)
        
        passwordField.placeholder = "Password"
        passwordField.font = .boldSystemFont(ofSize: 17)
        passwordField.borderStyle = .roundedRect
        passwordField.autocorrectionType = .no
        passwordField.keyboardType = .default
        passwordField.isSecureTextEntry = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.contentVerticalAlignment = .center
        containerView.addSubview(passwordField)
        activatePasswordFieldConstraints(view: passwordField, anchorView: usernameField)
        
        submitButton.backgroundColor = UIColor(red: 155.0 / 255.0, green: 89.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0)
        submitButton.setTitle("Login", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed(sender:)), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: passwordField)
        
        authorizationView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = authorizationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @objc func submitButtonDidPressed(sender: UIButton) {
        // Presenter call
    }
}

private typealias PrivateAuthorizationViewController = AuthorizationViewController
private extension PrivateAuthorizationViewController {
    func activateLoginLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateUsernameFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 40),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activatePasswordFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSubmitButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateContainerViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20)
            ])
    }
}
