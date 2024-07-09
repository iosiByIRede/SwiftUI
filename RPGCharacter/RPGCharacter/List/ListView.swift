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
        NavigationStack{
            ZStack {
                ImageBackgroundView()
                
                VStack() {
                    RPGTextField(text: $viewModel.searchText)
                    //                .padding(.top)
                    //                .padding(.horizontal)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    characterList
                }
                
                
            }
            .toolbar {
                
                ToolbarItem(placement: .navigation) {
                    Text("Personagens")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem {
                    if viewModel.isEditing {
                        okButton
                    } else {
                        menu
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        if viewModel.isEditing { viewModel.deleteSelectedChars() }
                        else { viewModel.addCharacter()}
                        
                    } label: {
                        Image(systemName: viewModel.isEditing ? "trash" : "plus.circle")
                            .font(.title2)
                            .foregroundStyle(viewModel.isEditing ? .red : .white)
                    }
                }
                
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        
    }
    
    var characterList: some View {
        List {
            ForEach(viewModel.getAllRaces, id: \.self) { race in
                
                Section(isExpanded: $viewModel.isShowingGroup) {
                    
                    ForEach(viewModel.getAllCharacters(race), id:\.name){ char in
                        
                        CardCharacter(
                            character: char,
                            isSelectedMode: viewModel.isEditing,
                            selectedCharacter: $viewModel.selectedChars
                        )
                        .listRowBackground(Color.clear)
                        
                    }
                    .onDelete { indexSet in
                        viewModel.deleteCharacter(char: indexSet, race: race)
                    }
                    .onMoveConditional (disabled: viewModel.isGrouped) { index, int in
                        viewModel.moveCharacter(fromOffsets: index, toOffset: int)
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
    
    var okButton: some View {
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
                withAnimation(.easeInOut(duration: 0.2)) {
                    viewModel.isGrouped.toggle()
                }
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
    NavigationStack {
        ListView()
    }
}
