//
//  HerosListView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation
import UIKit

class HerosListView: UIView {
    

    let headerLabel = {
       let label = UILabel()
        
        label.text = "MVC"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        //label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false // always use this!
        // my code
//        label.frame = CGRect(y: 150)
        label.sizeToFit()
        
        return label
    }()
    
    let herosTableView = {
        let tableView = UITableView()
        //tableView.backgroundColor = .blue
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HerosListViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Create/add subviews
        setUpViews()
    } // required
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } // required
    
    func setUpViews() {
        
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(herosTableView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60), // to superview
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16), // use negative to generate margin from the right side
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // constraints
            // herosTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 50),
            herosTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            herosTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            herosTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            herosTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    
}

