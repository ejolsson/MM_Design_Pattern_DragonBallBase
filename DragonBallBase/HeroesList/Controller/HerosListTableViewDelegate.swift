//
//  HerosListTableViewDelegate.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/19/23.
//

import Foundation
import UIKit

class HerosListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didTapOnCell: ((Int) -> Void)? // L14 1:37:40
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    } // complete
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // When tapping on a specific cell
        // Open another view controller to show the hero details // L14 1:36:45
        
        didTapOnCell?(indexPath.row) // L14 1:38:10
        
    }
    
} // complete
