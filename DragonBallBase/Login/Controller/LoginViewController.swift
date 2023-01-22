//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    var mainView: LoginView { self.view as! LoginView } // not sure this was doing anything...

    var emailTextField: UITextField?
    var passwordTextField: UITextField?
    var loginButton: UIButton?
    var errorMessageLabel: UILabel?
    
    var viewModel: LoginViewModel? // connect to MvvM?
//    var viewModel: HeroListViewModel?
    
    override func loadView() {
        
        let loginView = LoginView()
        
        emailTextField = loginView.emailTextField
        passwordTextField = loginView.passwordTextField
        loginButton = loginView.loginButton
        errorMessageLabel = loginView.errorMessageLabel
        
        view = loginView // source of error? was = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel = HeroListViewModel()
        viewModel = LoginViewModel()
        
        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        
//        mainView.loginButton.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
    }
    
    @objc func didLoginTapped(sender: UIButton) {
        // https://stackoverflow.com/questions/24030348/how-to-create-a-button-programmatically
        print("Login button tapped\n")
        
//        let loginViewModel = LoginViewModel() // ⚠️ was never used...
        let apiClient = ApiClient()
        
        // 1. Capture the text values entered in for the email and the password
        guard let email = emailTextField?.text, !email.isEmpty else {
            print("No email provided\n")
            return
        }
        
        guard let password = passwordTextField?.text, !password.isEmpty else {
            print("No password provided \n")
            return
        }
        
        // 2. Call view model to perform the login call with the apiClient
        // viewModel?.login(email: email, password: password)
        
        apiClient.login(user: email, password: password) { token, error in
            if let token = token {
                LoginViewModel.shared.save(token: token) // tokin persistence
                print("User: \(email)\n")
                print("Token valid")
                print(token)
                
                DispatchQueue.main.async {
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                        .first?
                        .rootViewController = HerosListTableViewController()
                    
//                    self.errorMessageLabel?.text = "Login token = \(token)"
                }
            } else {
                print("Login error: ", error?.localizedDescription ?? "")
                
                // TODO: - Error message -
//                self.errorMessageLabel?.text = "Login error"
            }
        }
        
        
        
//        loginViewModel.login(user: email, password: password, completion: (String?, Error?) -> Void) {
//            guard let url = URL(string: "https://dragonball.keepcoding.education/api/auth/login") else {
//                completion(nil, NetworkError.malformedURL)
//                return
//            }
//        }
        
        // 3. Show the token or the returned error
    }
//    init(loginModel: ApiClient) {
//        super.init(nibName: nil, bundle: nil)
//        mainView.configure(loginModel)
//    }
}
