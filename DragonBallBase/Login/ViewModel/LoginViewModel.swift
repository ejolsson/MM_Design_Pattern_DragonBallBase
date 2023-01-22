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
    
    // below func login migrated from ApiClient...
//    func login(user: String, password: String, completion: @escaping (String?, Error?) -> Void) {
//
//      guard let url = URL(string: "\(Constants.api_base_url)/auth/login") else {
//        completion(nil, NetworkError.malformedURL)
//        return
//      }
//
//      let loginString = String(format: "%@:%@", user, password)
//      let loginData = loginString.data(using: String.Encoding.utf8)!
//      let base64LoginString = loginData.base64EncodedString()
//
//      var urlRequest = URLRequest(url: url)
//      urlRequest.httpMethod = "POST"
//      urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//
//      let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//        guard error == nil else {
//          completion(nil, NetworkError.unknown)
//          return
//        }
//
//        guard let data = data else {
//          completion(nil, NetworkError.noData)
//          return
//        }
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//          completion(nil, NetworkError.statusCode(code: (response as? HTTPURLResponse)?.statusCode))
//          return
//        }
//
//        guard let response = String(data: data, encoding: .utf8) else {
//          completion(nil, NetworkError.decodingFailed)
//          return
//        }
//
//        self.token = response
//        completion(response, nil)
//      }
//
//      task.resume()
//    }
 
    
    
    // IMPORT LocalDataLayer from previous project
    
    private static let token = "token"
    private static let heros = "heros"
    
//    static let shared = LocalDataLayer()
    
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
    
    // Mirgrated func getHeros fm ApiClient
//    func getHeroes(completion: @escaping ([HeroModel], Error?) -> Void) {
//      guard let url = URL(string: "\(Constants.api_base_url)/heros/all"), let token = self.token else {
//        completion([], NetworkError.malformedURL)
//        return
//      }
//
//      var urlComponents = URLComponents()
//      urlComponents.queryItems = [URLQueryItem(name: "name", value: "")]
//
//      var urlRequest = URLRequest(url: url)
//      urlRequest.httpMethod = "POST"
//      urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//      urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
//
//      let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//        guard error == nil else {
//          completion([], NetworkError.unknown)
//          return
//        }
//
//        guard let data = data else {
//          completion([], NetworkError.noData)
//          return
//        }
//
//        guard let response = try? JSONDecoder().decode([HeroModel].self, from: data) else {
//          completion([], NetworkError.decodingFailed)
//          return
//        }
//        completion(response, nil)
//      }
//
//      task.resume()
//    }

}
