//
//  HerosListTableViewDelegate.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class HerosListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    } 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
} 
