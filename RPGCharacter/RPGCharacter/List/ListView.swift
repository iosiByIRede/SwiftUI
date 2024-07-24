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
                List() {
                    ForEach(viewModel.getAllRaces, id: \.self){ race in
                        Section(isExpanded: $viewModel.isExpanded) {
                            ForEach(viewModel.getAllCharacters(race)){ character in
                                CardCharacter(character: character, selectedCharacter: .constant([]))
                                    .listRowBackground(Color.clear)
                            }
                            
                        } header: {
                            if viewModel.isGrouped {
                                Text(race).foregroundColor(.white)
                                    .font(.title)
                            }
                        }

                    }
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
                        Button(viewModel.buttonGroupTitle) {
                            if viewModel.isGrouped {
                                viewModel.isExpanded = true
                            }
                            viewModel.isGrouped.toggle()
                        }
                        
                        Button(viewModel.buttonCollapsedTitle) {
                            withAnimation {
                                viewModel.isExpanded.toggle()
                            }
                        }
                        .disabled(!viewModel.isGrouped)

                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundStyle(.white)

                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}


#Preview {
    ListView()
}
