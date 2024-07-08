//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    @State var viewModel: CharacterListViewModel = CharacterListViewModel()
    
    var menu: some View {
        Menu(content: {
            
            Button(viewModel.isGrouped ? "Desagrupar" : "Agrupar") {
                if viewModel.isGrouped {
                    viewModel.isShowingGroup = true
                } // View Model
                withAnimation(.easeInOut(duration: 0.2)) {
                    viewModel.isGrouped.toggle()
                }
            }
            
            Button(viewModel.isShowingGroup ? "Colapsar" : "Expandir") {
                withAnimation(.easeInOut(duration: 0.2)) {
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
            
        }, label: {
            Image(systemName: "ellipsis.circle")
                .font(.title)
        })
    }
    
    var okButton: some View {
        Button("OK") {
            withAnimation {
                viewModel.selectedChars = []
                self.viewModel.isEditing.toggle()
            }
        }
        .font(.title2)
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                RPGBackground()
                
                VStack() {
                    RPGTextField(text: $viewModel.searchText)
                        .padding()
                    groupedList
                }
                
            }
            .toolbar {
                
                ToolbarItem(placement: .navigation) {
                    Text("Personagens")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem(placement: .automatic) {
                    if viewModel.isEditing {
                        okButton
                    } else {
                        menu
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: {
                        NewCharacterView()
//                        viewModel.addCharacter()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title)
                    })
                }
                
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(Keys.updateCharacter)), perform: { notification in
            if let character = notification.userInfo?[Keys.character] as? Character {
                viewModel.addCharacter(character)
            }
        })
    }
    
    var groupedList: some View {
        List {
            ForEach(viewModel.allRaces, id: \.self) { race in
                Section(isExpanded: $viewModel.isShowingGroup) {
                    ForEach(viewModel.getAllCharacters(race), id:\.name){ char in
                        
                        CardCharacter(
                            character: char,
                            isSelectedMode: viewModel.isEditing,
                            selectedCharacter: $viewModel.selectedChars
                        )
                        
                        .listRowBackground(Color.clear)
                        
                    }
                    .onDelete(perform: { indexSet in
                        
                    })
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
}

#Preview {
    NavigationStack{
        ListView()
    }
}
