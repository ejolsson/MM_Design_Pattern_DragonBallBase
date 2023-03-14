//
//  HerosListView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation
import UIKit

class HerosListView: UIView {
    
    // CREATE HEADER VIEW
    
    let headerLabel = {
       let label = UILabel()
        label.text = "Heros"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // CREATE TABLE VIEW
    
    let herosTableView = {
        let tableView = UITableView()

        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HerosListViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Create/add subviews
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(herosTableView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            herosTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            herosTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            herosTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            herosTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
