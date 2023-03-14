//
//  HerosListTableViewDataSource.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation
import UIKit

class HerosListTableViewDataSource: NSObject, UITableViewDataSource {
  
    let tableView: UITableView
    
    var heros: [HeroModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, heros: [HeroModel] = []) {
        self.heros = heros
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HerosListViewCell", for: indexPath) as! HeroListViewCell
        
        let hero = heros[indexPath.row]
        
        cell.configure(hero)
        
        return cell
    }
    
}
