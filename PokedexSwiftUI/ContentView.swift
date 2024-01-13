//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by Gustavo Fernandes on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    @State private var pokemonToSearch = ""
    
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        
   ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: numberOfColumns){
                    ForEach(viewModel.fileterdPokemon, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCellView(pokemon: pokemon, viewModel: viewModel)
                        }
                        
                    }
                }.padding(20)
                    
            } // scroll
            .shadow(radius: 12)
            .searchable(text: $pokemonToSearch, prompt: "Procure o Pokemon")
            .onChange(of: pokemonToSearch, perform: { newValue in
                withAnimation {
                    viewModel.filterPokemon(name: newValue)
                }
            })
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                           
                            Button {
                            } label: {
                                VStack {
                                    Image(systemName: "house.fill")
                                    Text("Inicio")
                                }
                                
                            }
                            .foregroundStyle(.black)
                            .padding(20)
                    
                            Button() {
                            } label: {
                                VStack {
                                    Image(systemName: "doc.plaintext.fill")
                                    Text("Detalhes")
                                }
                            }
                            .foregroundStyle(.black)
                            .padding(20)
                            
                        }
                    }
            .navigationBarTitle("Pokedex", displayMode: .large)
        }
        
    }
}

#Preview {
    ContentView()
}

