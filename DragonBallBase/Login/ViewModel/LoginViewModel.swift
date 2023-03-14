//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/21/23.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    
    private static let token = "token"
    private static let heros = "heros"
    let apiClient = ApiClient()
    
    static let shared = LoginViewModel()
    
    func save(token: String) {
        return UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    
    func isUserLoggedIn() -> Bool {
        return !getToken().isEmpty
    }
    
    func save(heros: [HeroModel]) {
        if let encodedHeros = try? JSONEncoder().encode(heros) {
            UserDefaults.standard.set(encodedHeros, forKey: Self.heros)
        }
    }
    
    func getHeros() -> [HeroModel] {
        if let savedHerosData = UserDefaults.standard.object(forKey: Self.heros) as? Data {
            do {
                let savedHeros = try JSONDecoder().decode([HeroModel].self, from: savedHerosData)
                return savedHeros
            } catch {
                print("Error occurred")
                return []
            }
        } else {
            return []
        }
    }
    
    func login(email: String, password: String) {
        
        apiClient.login(user: email, password: password) { token, error in
            if let token = token {
                LoginViewModel.shared.save(token: token)
                print("User: \(email)\n")
                print("Token valid: \(token)")
                
                DispatchQueue.main.async {
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                        .first?
                        .rootViewController = HerosListTableViewController()
                    print(error as Any)
                }
            } else {
                print("Login error: ", error?.localizedDescription ?? "")
            }
        }
    }
}
