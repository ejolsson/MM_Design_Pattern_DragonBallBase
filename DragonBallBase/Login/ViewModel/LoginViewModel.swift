//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/21/23.
//

import Foundation

//enum NetworkError: Error {
//    case malformedURL
//    case noData
//    case statusCode(code: Int?)
//    case decodingFailed
//    case unknown
//}

class LoginViewModel: NSObject {
    
    private static let token = "token"
    private static let heros = "heros"
    
    static let shared = LoginViewModel() // LocalDataLayer()
    
    func save(token: String) {
        return UserDefaults.standard.set(token, forKey: Self.token)
    } // complete
    
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    } // complete
    
    func isUserLoggedIn() -> Bool {
        return !getToken().isEmpty
    } // complete
    
    func save(heros: [HeroModel]) {
        if let encodedHeros = try? JSONEncoder().encode(heros) {
            UserDefaults.standard.set(encodedHeros, forKey: Self.heros)
        }
    } // complete
    
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
