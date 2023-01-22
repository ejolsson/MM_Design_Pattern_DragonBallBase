//
//  LoginModel.swift
//  DragonBallBase
//
//  Created by Eric Olsson on 1/21/23.
//

import Foundation

struct LoginModel: Decodable {
    let userEmail: String
    let userPassword: String
    let loginButton: String
    let loginErrorMessage: String
    let testButton: String
}
