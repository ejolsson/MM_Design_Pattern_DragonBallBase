//
//  HerosListView.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/16/23.
//

import Foundation
import UIKit

class HerosListView: UIView { // main view page, generic
    
    // CREATE HEADER VIEW
    
    let headerLabel = { // programmatic way to create UI, like a function but in a constant
       let label = UILabel() // instantiate a label for specific use
        // attribute the label below
        label.text = "Heros"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false // always use this! don't let complier make guesses for us
        
        return label // output label into memory
    }() // using () to make it function like
    
    // CREATE TABLE VIEW
    
    let herosTableView = {
        let tableView = UITableView() // instantiate for our use
        //tableView.backgroundColor = .blue // used for demo & visibility
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HerosListViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Create/add subviews
        setUpViews() // call subViews function created below
    }
    
    required init?(coder: NSCoder) { // ? optional b/c usually null
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        backgroundColor = .white
        
        addSubview(headerLabel) // this brings the created headerLabel into view, addSubview is an extension of UIKit
        addSubview(herosTableView) // this brings the created herosTableView into view
        
        NSLayoutConstraint.activate([ // array of constraints, otherwised built used Xcode UI
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

