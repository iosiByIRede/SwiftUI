//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    
    @State var viewModel: CharacterListViewModel = .init()
    @Environment(\.editMode) var editMode
    
    var body: some View {
        ZStack {
            imageBackground
            groupedList
                .padding(.top, 60)
        }
        .overlay(alignment: .topTrailing) {
            Menu {
                Button("Agrupar") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        viewModel.isGrouped.toggle()
                    }
                }
                Button("Colapsar") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        viewModel.isShowing.toggle()
                    }
                }
                .disabled(!viewModel.isGrouped)
                EditButton()
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.largeTitle)
            }
        }
        .overlay(alignment: .top) {
            RPGTextField(text: $viewModel.searchText)
                .padding(.horizontal,48)
        }
        .onChange(of: editMode?.wrappedValue, {
            viewModel.selectedChars = []
            self.viewModel.isEditing.toggle()
        })
    }
    
    var groupedList: some View {
        List {
            ForEach(viewModel.sortedRaceChar, id: \.description) { races in
                Section(isExpanded: $viewModel.isShowing) {
                    ForEach(races, id:\.name){ char in
                        CardCharacter(character: char,
                                      selectedCharacter: $viewModel.selectedChars,
                                      isSelectedMode: viewModel.isEditing)
                        .listRowBackground(Color.clear)
                    }
                } header: {
                    if let race = races.first {
                        Text(race.race.rawValue).foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    var imageBackground: some View {
        Image("bricksBG")
            .resizable()
            .overlay {
                LinearGradient(colors: [Color.rpgGrayedBlue, Color.rpgLightBrown], startPoint: .top, endPoint: .bottom)
                    .opacity(0.45)
            }
            .ignoresSafeArea()
    }
    
}

#Preview {
        ListView()
}
