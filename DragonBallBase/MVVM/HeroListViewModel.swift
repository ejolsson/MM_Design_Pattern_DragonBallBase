//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//
// ✅ complete
import Foundation
//import UIKit
// this ViewModel (MvvM) replaces "controller" portion of MVC. This previously lived in Controller > HerosListTableViewDataSource
class HeroListViewModel: NSObject {
    
    override init() {
        // leave empty...
    }
    var updateUI: ((_ heros: [HeroModel]) -> Void)?
    
    func fetchData() { // used in HerosListTableVC to build out Heros
        // TODO: - Remove this token for login process -
        
        let myToken = LoginViewModel.shared.getToken() // get token from initial login session
        
//        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjZDRDhGN0QwLTQwRTMtNEM3MS05M0JDLTlBMTlENTg2REI2QiIsImVtYWlsIjoiZWpvbHNzb24xQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.1ChGTrO9S8xWe6oouONVEq4VAnO0I87KTumgA_3JVwE" // copy-paste fm ejolsson1 token
        
        let apiClient = ApiClient(token: myToken)
        
        //let apiClient = ApiClient(token: ApiClient.login.token)
        
        // move to LoginViewController.didLoginTapped ???
        apiClient.getHeroes { [weak self] heros, error in // always use weak self
            self?.updateUI?(heros)  // builds out next view
        }
        
    } // ViewModel: Presentation logic
    
    //    func login() {
    //        // pmg@test.com / !Test1234
    //
    //        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjEyMzlFNERBLTM3N0MtNERGMS1CRTEwLTY5QjVFODZDNzA4RSIsImVtYWlsIjoicG1nQHRlc3QuY29tIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.t-vay9I3gno6WHT0v7Tm7EJ4RPXZZjh3ZX6-nJEz33k"
    //
    //        let apiClient = ApiClient(token: myToken)
    //
    //        apiClient.login(user: <#T##String#>, password: <#T##String#>, completion: <#T##(String?, Error?) -> Void#>)
    //        }
    //    }
    
}
