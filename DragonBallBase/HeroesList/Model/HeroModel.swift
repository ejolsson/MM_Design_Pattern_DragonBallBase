//
//  HeroModel.swift
//  DragonMVC
//
//  Created by Pedro Martín on 7/1/23.
//

import Foundation

struct HeroModel: Codable { // Was Decodable, updating to Codable to conform to token saving
  let photo: String
  let id: String
  let favorite: Bool
  let name: String
  let description: String
}
