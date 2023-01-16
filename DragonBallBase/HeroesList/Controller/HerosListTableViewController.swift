//
//  HerosListTableViewController.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation
import UIKit

class HerosListTableViewController: UIViewController {
    
    var mainView: HerosListView { self.view as! HerosListView }
    var heros: [HeroModel] = []
    
    var tableViewDataSource: HerosListTableViewDataSource?
    
    override func loadView() {
        view = HerosListView()
        
        tableViewDataSource = HerosListTableViewDataSource (tableView: mainView.herosTableView)

        mainView.herosTableView.dataSource = tableViewDataSource
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CALL API TO GET HEROS LIST
        fetchData()
        
    }
    
    func fetchData() {
        
        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjZDRDhGN0QwLTQwRTMtNEM3MS05M0JDLTlBMTlENTg2REI2QiIsImVtYWlsIjoiZWpvbHNzb24xQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.1ChGTrO9S8xWe6oouONVEq4VAnO0I87KTumgA_3JVwE" // ejolsson1 token
        
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes { [weak self] heros, error in // always use weak self
//            debugPrint("PMG: \(heroes)")
//            debugPrint("PMG: ", error ?? "")
            self?.heros = heros // need the ? when using weak self
            self?.tableViewDataSource?.heros = heros
        }
    }
    
}
