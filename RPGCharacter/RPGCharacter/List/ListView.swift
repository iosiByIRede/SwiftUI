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
                List {
                    ForEach(viewModel.getAllRaces, id: \.self) { race in
                        Section(isExpanded: $viewModel.isShowingGroup) {
                            ForEach(viewModel.getAllCharacters(race), id: \.name){
                                CardCharacter(character: $0, isSelectedMode: viewModel.isEditing, selectedCharacter: $viewModel.selectedChars)
                                    .listRowBackground(Color.clear)
                            }
                            .onDelete { indexSet in
                                viewModel.deleteCharacter(indexSet: indexSet, race: race)
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
                    if(viewModel.isEditing){
                        checkedButton
                    }else {
                        menu
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        if viewModel.isEditing { viewModel.deleteSelectedChars() }
                        else { viewModel.addCharacter()}
                    }, label: {
                        Image(systemName: viewModel.isEditing ? "trash" : "plus.circle")
                            .font(.title2)
                            .foregroundStyle(viewModel.isEditing ? .red : .white)
                    })
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
    
    var checkedButton: some View {
        Button {
            withAnimation {
                viewModel.selectedChars = []
                viewModel.isEditing.toggle()
            }
        } label: {
            Image(systemName: "checkmark.circle")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
    
    var menu: some View {
        Menu {
            Button(viewModel.isGrouped ? "Desagrupar" : "Agrupar") {
                if viewModel.isGrouped {
                    viewModel.isShowingGroup = true
                }
                viewModel.isGrouped.toggle()
            }
            
            Button(viewModel.isShowingGroup ? "Colapsar" : "Expandir") {
                withAnimation {
                    viewModel.isShowingGroup.toggle()
                }
            }
            .disabled(!viewModel.isGrouped)
            
            Button("Edit") {
                withAnimation {
                    viewModel.selectedChars = []
                    viewModel.isEditing.toggle()
                }
            }
            
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title2)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    ListView()
}
