//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Gustavo Fernandes on 11/01/24.
//

import Foundation
import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var listPokemon = [PokemonModel]()
    @Published var fileterdPokemon = [PokemonModel]()
    
    init() {
        getListPokemon()
        
    }
    func getListPokemon() {
        NetworkManager.shared.getListOfPokemon { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let listPokemon):
                    print("list Pokemon: \(listPokemon.count)")
                    self.listPokemon = listPokemon
                    self.fileterdPokemon = listPokemon
                    
                case .failure (let error):
                            print("Error : \(error.localizedDescription)")
                }
            }
        }
    }
    // filtra o pokemon pelo nome utilizado na searchbar
    func filterPokemon(name: String) {
        if name.isEmpty {
            fileterdPokemon = listPokemon
        } else {
            fileterdPokemon = listPokemon.filter({ pokemon in
                pokemon.name.lowercased().contains(name.lowercased())
            })
        }
        
    }
    
    
    
    func getColorBasedOnType(type: String) -> Color {
        switch type {
        case "poison":
            return .purple
        case "fire":
            return .red
        case "water":
            return .blue
        case "bug":
            return .green
        case "flying":
            return .mint
        case "normal":
            return .pink
        case "electric":
            return .yellow
        case "ground":
            return .brown
        case "fairy","psychic","dragon":
            return .orange
        case "fighting":
            return .gray
        case "ice", "steel":
            return .teal
        default:
            return .white
            
        }
    }
    
}
