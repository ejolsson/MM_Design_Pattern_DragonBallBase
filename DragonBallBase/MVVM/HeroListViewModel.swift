//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation

class HeroListViewModel: NSObject {
    
    override init() {
    }
    var updateUI: ((_ heros: [HeroModel]) -> Void)?
    
    func fetchData() {
        
        let myToken = LoginViewModel.shared.getToken()
     
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes { [weak self] heros, error in
            self?.updateUI?(heros)  // build out tableView
        }
    }
}
