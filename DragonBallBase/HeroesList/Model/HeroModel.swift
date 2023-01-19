//
//  HeroModel.swift
//  DragonMVC
//
//  Created by Pedro Martín on 7/1/23.
//

import Foundation

struct HeroModel: Decodable { // automatically provided at start of class, quite simple
  let photo: String
  let id: String
  let favorite: Bool
  let name: String
  let description: String
}
