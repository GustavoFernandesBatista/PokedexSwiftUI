//
//  PokemonCellView.swift
//  PokedexSwiftUI
//
//  Created by Gustavo Fernandes on 11/01/24.
//

import SwiftUI

struct PokemonCellView: View {
    
    let pokemon: PokemonModel
    let viewModel: PokemonViewModel
    
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(viewModel.getColorBasedOnType(type: pokemon.type))
                .cornerRadius(25)
            
            VStack{
                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 130, height: 130)
                
                .shadow(radius: 12)
                
                Text(pokemon.name.uppercased())
                    .font(.custom("Pokemon GB", size: 10))
                    .foregroundColor(.white)
            }
        }
    }
}
