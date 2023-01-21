//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var emailTextField: UITextField?
    var passwordTextField: UITextField?
    var loginButton: UIButton?
    var errorMessageLabel: UILabel?
    
    var mainView: LoginView { self.view as! LoginView }
    var viewModel: LoginViewModel? // connect to MvvM?
    
    override func loadView() {
        
        let loginView = LoginView()
        
        emailTextField = loginView.emailTextField
        passwordTextField = loginView.passwordTextField
        loginButton = loginView.loginButton
        errorMessageLabel = loginView.errorMessageLabel
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewModel = LoginViewModel
        //loginButton?.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
    }
//    init(loginModel: ApiClient) {
//        super.init(nibName: nil, bundle: nil)
//        mainView.configure(loginModel)
//    }
}
