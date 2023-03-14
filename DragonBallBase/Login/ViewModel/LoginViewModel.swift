//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/21/23.
//

import Foundation

class LoginViewModel: NSObject {
    
    private static let token = "token"
    private static let heros = "heros"
    
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
}
