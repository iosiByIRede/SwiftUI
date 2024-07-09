//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    @State var viewModel: CharacterListViewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ImageBackgroundView()
                List(viewModel.characters) { character in
                    CardCharacter(character: character, selectedCharacter: .constant([]))
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Personagens")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(viewModel.isGrouped ? "Desagrupar" : "Agrupar") {
                            viewModel.isGrouped.toggle()
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundStyle(.white)

                    }

                }
            }
        }
    }
}

#Preview {
    ListView()
}
