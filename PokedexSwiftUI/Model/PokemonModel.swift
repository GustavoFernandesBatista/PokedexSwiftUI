//
//  PokemonModel.swift
//  PokedexSwiftUI
//
//  Created by Gustavo Fernandes on 11/01/24.
//

import Foundation

struct PokemonModel: Codable, Hashable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
    
}
