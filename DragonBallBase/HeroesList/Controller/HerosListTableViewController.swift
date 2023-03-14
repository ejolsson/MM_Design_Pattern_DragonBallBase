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
    
    var viewModel: HeroListViewModel?
    
    var tableViewDataSource: HerosListTableViewDataSource?
    var tableViewDelegate: HerosListTableViewDelegate?
    
    override func loadView() {
        view = HerosListView()

        tableViewDataSource = HerosListTableViewDataSource (tableView: mainView.herosTableView)
        mainView.herosTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HerosListTableViewDelegate()
        mainView.herosTableView.delegate = tableViewDelegate
    } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel = HeroListViewModel()
        
        setUpUpdateUI()
        setUpTableDelegate()
        getData()
    }
    
    func setUpUpdateUI() {
        // preparing to receive data that comes from ViewModel
        viewModel?.updateUI = { [weak self] heros in
            self?.heros = heros
            self?.tableViewDataSource?.heros = heros
        }
    }
    
    func getData() {
        // CALL API TO GET HERO LIST
        viewModel?.fetchData()
    }
    
    func setUpTableDelegate() {
        tableViewDelegate?.didTapOnCell = { [weak self] index in // L14 1:39:30
            
            guard let datasource = self?.tableViewDataSource else {
                return
            }
            
            let hero = datasource.heros[index]
            
            let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
            
            self?.present(heroDetailViewController, animated: true)
        }
    }
}
