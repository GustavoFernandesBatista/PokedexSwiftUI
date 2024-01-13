//
//  PokemonDetailView.swift
//  PokedexSwiftUI
//
//  Created by Gustavo Fernandes on 11/01/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State private var isAnimating = false
    
    let pokemon: PokemonModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                ProgressView()
            }
            
            .frame(maxHeight: 230)
            .shadow(radius: 12)
            .scaleEffect(isAnimating ? 1.2 : 0.7)
            .padding(20)
            ZStack{
                Rectangle().foregroundColor(.clear)
                    .cornerRadius(25)
                Text(pokemon.type.uppercased())
                    .font(.custom("Pokemon GB", size: 20))
            }
            .frame(width: 120, height: 55)
            .shadow(radius: 12)
            .padding(20)
            Text(pokemon.description)
                .font(.custom("Pokemon GB", size: 15))
                .lineLimit(30)
            Spacer()
            VStack{
                VStack {
                    ZStack{
                        Rectangle().foregroundColor(.red)
                        .cornerRadius(20)
                        Text("Attack: \(pokemon.attack)")
                            .foregroundStyle(.white)
                    }
                        .font(.custom("Pokemon GB", size: 20))
                        .padding(1)
                    ZStack{
                        Rectangle().foregroundColor(.green)
                        .cornerRadius(20)
                        Text("Defense: \(pokemon.attack)")
                            .foregroundStyle(.white)
                            .font(.custom("Pokemon GB", size: 20))
                    }
                }
                .padding()
                .font(.title2)
                .bold()
            }
            .padding(20)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    isAnimating = true
                }
            }
        }
        .padding(15)
        .navigationTitle(pokemon.name.capitalized)
    }
}
#Preview {
    PokemonDetailView(pokemon: MockData.pokemon)
}
