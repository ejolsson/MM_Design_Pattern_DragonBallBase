//
//  HerosListTableViewController.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//
// ✅ complete
import Foundation
import UIKit

class HerosListTableViewController: UIViewController {
    // paste class name above into Main.storyboard > Identity Inspector (⌘ + ⌥ + 4) > Custom Class > Class
    var mainView: HerosListView { self.view as! HerosListView }
    var heros: [HeroModel] = []
    
    var viewModel: HeroListViewModel? // just added this fm MvvM
    
    var tableViewDataSource: HerosListTableViewDataSource?
    var tableViewDelegate: HerosListTableViewDelegate?
    
    override func loadView() {
        view = HerosListView()

        tableViewDataSource = HerosListTableViewDataSource (tableView: mainView.herosTableView)
        mainView.herosTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HerosListTableViewDelegate() // why is this placed here?
        mainView.herosTableView.delegate = tableViewDelegate
    } // complete
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel = HeroListViewModel()
        
        setUpUpdateUI()
        setUpTableDelegate()
        getData()
    }
    
    func setUpUpdateUI() {
        // PREPARÁNDOME PARA RECIBIR LOS DATOS QUE VIENE DEL VIEWMODEL // preparing to receive data that comes from ViewModel
        viewModel?.updateUI = { [weak self] heros in
            self?.heros = heros
            self?.tableViewDataSource?.heros = heros
        }
    }
    
    func getData() {
        // CALL API TO GET HERO LIST
        viewModel?.fetchData()
    } // complete
    
    func setUpTableDelegate() {
        tableViewDelegate?.didTapOnCell = { [weak self] index in // L14 1:39:30
            
            guard let datasource = self?.tableViewDataSource else {
                return
            }
            
            // Get the hero in the hero list according to the position index
            let hero = datasource.heros[index] // L14 1:41:50
            
            // Prepare the viewcontroller that I want to present
            let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
            
            // Present the controller to show the details
            
            self?.present(heroDetailViewController, animated: true) // L14 1:44:10, present = modal popup, L14 2:03:10
        }
    }
    
}
