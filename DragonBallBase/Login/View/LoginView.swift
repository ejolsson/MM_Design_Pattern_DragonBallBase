//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    // USERNAME, PASSWORD, LOGIN BUTTON
    let emailTextField = {
        let emailTextField = UITextField()
        
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 17)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    let passwordTextField = {
        let passwordTextField = UITextField()
        
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 17)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()

    let loginButton = {
        let loginButton = UIButton()
        
        loginButton.backgroundColor = .blue
        // loginButton.currentTitleColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        backgroundColor = .darkGray
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        //addSubview(loginButton)
        
        NSLayoutConstraint.activate([
        
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 80),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
        
        ])
    }
    
}
