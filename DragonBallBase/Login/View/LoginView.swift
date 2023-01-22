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
        textField.borderStyle = .line // used to troubleshoot size // https://stackoverflow.com/questions/1861527/uitextfield-border-color
//        textField.layer.borderColor = [[UIColor( red: 240, green: 0, blue: 0, alpha: 1)]] as! CGColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "password"
        textField.borderStyle = .line // used to troubleshoot size
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    let loginButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
//        button.buttonType = .roundedRect
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 1) // no dice
        // loginButton.currentTitleColor = .white
        return button
    }()
    
    let errorMessageLabel = {
        let label = UILabel()
        
        label.text = "Error message section"
        label.layer.borderColor = UIColor.darkGray.cgColor // for troubleshooting... https://stackoverflow.com/questions/2311591/how-to-draw-border-around-a-uilabel
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
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            emailTextField.heightAnchor.constraint(equalToConstant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 80),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 20),
            
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
