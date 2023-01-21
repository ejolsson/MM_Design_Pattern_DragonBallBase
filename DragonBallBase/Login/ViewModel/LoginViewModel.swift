//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/21/23.
//

import Foundation

class LoginViewModel: NSObject {
    
    override init() {
        // leave empty...
    }
    
    // var updateUI: ((_ login: [LoginModel]) -> Void)?
    var updateUI: ((_ heros: [HeroModel]) -> Void)?
    
    // migrate below code from HeroListViewModel...
    
    func fetchData() {
        // TODO: - Remove this token for login process -
        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjZDRDhGN0QwLTQwRTMtNEM3MS05M0JDLTlBMTlENTg2REI2QiIsImVtYWlsIjoiZWpvbHNzb24xQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.1ChGTrO9S8xWe6oouONVEq4VAnO0I87KTumgA_3JVwE" // copy-paste fm ejolsson1 token
        
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes { [weak self] heros, error in // always use weak self
            self?.updateUI?(heros)
        }
        
    }
}
