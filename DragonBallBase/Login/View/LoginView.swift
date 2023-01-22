//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    // CONFIG HEADER, USERNAME, PASSWORD, LOGIN BUTTON
    
    let loginLabel = {
        let label = UILabel()
        
        label.text = "Login"
//        label.layer.borderColor = UIColor.darkGray.cgColor
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "email"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 5
//        textField.borderStyle = .line // used to troubleshoot size // https://stackoverflow.com/questions/1861527/uitextfield-border-color
//        textField.layer.borderColor = [[UIColor( red: 240, green: 0, blue: 0, alpha: 1)]] as! CGColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "password"
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 5
//        textField.borderStyle = .line // used to troubleshoot size
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

        return button
    }()
    
    var errorMessageLabel = {
        let label = UILabel()
        
        label.text = "" // "Error message section"
//        label.layer.borderColor = UIColor.darkGray.cgColor // for troubleshooting... https://stackoverflow.com/questions/2311591/how-to-draw-border-around-a-uilabel
//        label.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 0.5) // doesn't show...
//        label.layer.borderWidth = 2.0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.sizeToFit() // align text vertically to top of box // DOESN'T WORK ☹️
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let testButton = {
        let button = UIButton()
        
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
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
        
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(errorMessageLabel)
//        addSubview(testButton)
        
        //let xConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.tableView, attribute: .centerX, multiplier: 1, constant: 0)
        let xConstraint = NSLayoutConstraint(item: loginLabel, attribute: .centerX, relatedBy: .equal, toItem: loginLabel, attribute: .centerX, multiplier: 1, constant: 0)
          
        NSLayoutConstraint.activate([
        
            // https://stackoverflow.com/questions/27624133/programmatically-add-centerx-centery-constraints
            // emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            // emailTextField.contentHorizontalAlignment,
            
//            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor), // doesn't do anything
            xConstraint, // does nothing
            
            loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
//            loginLabel.leadingAnchor.constraint(equalTo: superview.center),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            loginLabel.widthAnchor.constraint(equalToConstant: 80),
            
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: 120),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 30),
            
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 60),
        
//            testButton.leadingAnchor.constraint(equalTo: errorMessageLabel.leadingAnchor),
//            testButton.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
//            testButton.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 20),
//            testButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func configure(_ model: ApiClient) {
        //self.emailTextField.text = model.login(user: String)
        
    }
}
