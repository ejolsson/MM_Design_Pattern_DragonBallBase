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
    
    // below lines (13-18 ported from ApiClient class
//    var token: String? // should be private var
//
//    convenience init(token: String) {
//      self.init()
//      self.token = token
//    }
//
//    static let shared = LoginViewModel() // don't know if I need this
//
    override init() {
        // leave empty...
    }
    
    // var updateUI: ((_ login: [LoginModel]) -> Void)?
    var updateUI: ((_ heros: [HeroModel]) -> Void)?
    
    // migrate below code from HeroListViewModel...
    
    // ⭐️ Below is NEVER / NOT used!!! Consider removing
    func fetchData() {
        // TODO: - Remove this token for login process -
        
        // HARD CODED TOKEN...
        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjZDRDhGN0QwLTQwRTMtNEM3MS05M0JDLTlBMTlENTg2REI2QiIsImVtYWlsIjoiZWpvbHNzb24xQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.1ChGTrO9S8xWe6oouONVEq4VAnO0I87KTumgA_3JVwE" // copy-paste fm ejolsson1 token
        
        // let apiClient = ApiClient(token: myToken)
        // END HARD CODED SECTION
        
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes { [weak self] heros, error in // always use weak self
            self?.updateUI?(heros)
        } // was apiClient
        
    }
        
    // IMPORT LocalDataLayer from previous project
    
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
