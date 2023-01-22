//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//
// this ViewModel (MvvM) replaces "controller" portion of MVC. This previously lived in Controller > HerosListTableViewDataSource

import Foundation
// import UIKit

class HeroListViewModel: NSObject {
    
    override init() {
        // leave empty...
    }
    var updateUI: ((_ heros: [HeroModel]) -> Void)?
    
    func fetchData() { // used in HerosListTableVC to build out Heros
        // TODO: - Remove this token for login process -
        
        let myToken = LoginViewModel.shared.getToken() // get token from initial login session
     
        /*
        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjZDRDhGN0QwLTQwRTMtNEM3MS05M0JDLTlBMTlENTg2REI2QiIsImVtYWlsIjoiZWpvbHNzb24xQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.1ChGTrO9S8xWe6oouONVEq4VAnO0I87KTumgA_3JVwE" // copy-paste fm ejolsson1 token
        */
        
        let apiClient = ApiClient(token: myToken) // pull token to access api
        
        apiClient.getHeroes { [weak self] heros, error in // always use weak self
            self?.updateUI?(heros)  // builds out the tableView
        }
        
    } // ViewModel: Presentation logic
    
}
