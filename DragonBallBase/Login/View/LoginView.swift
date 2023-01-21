//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    // CONFIG USERNAME, PASSWORD, LOGIN BUTTON
    let emailTextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    let loginButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 1) // no dice
        // loginButton.currentTitleColor = .white
        return button
    }()
    
    let errorMessageLabel = {
        let label = UILabel()
        
        label.text = "Hi"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        backgroundColor = .white
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
        
            // https://stackoverflow.com/questions/27624133/programmatically-add-centerx-centery-constraints
            // emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            // emailTextField.contentHorizontalAlignment,
            
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            //emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 80),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 60),
        
        ])
    }
    
    func configure(_ model: ApiClient) {
        //self.emailTextField.text = model.login(user: String)
        
    }
}
