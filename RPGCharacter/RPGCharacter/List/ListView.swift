//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    
    @State var viewModel: CharacterListViewModel = .init()
    
    @State var isCharacterSheetPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                imageBackground
                VStack {
                    RPGTextField(text: $viewModel.searchText)
                        .padding()
                    groupedList
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Personagens")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic, content: {
                    if viewModel.isEditing {
                        okButton
                    } else {
                        menuPicker
                    }
                })
                ToolbarItem(placement: .primaryAction, content: {
                    Button(action: {
//                        NewCharacterView()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title)
                    })
                })
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
    
    var groupedList: some View {
        List {
            ForEach(viewModel.sortedRaceChar, id: \.description) { races in
                Section(isExpanded: $viewModel.isShowing) {
                    ForEach(races, id:\.name){ char in
                        CardCharacter(character: char,
                                      selectedCharacter: $viewModel.selectedChars,
                                      isSelectedMode: viewModel.isEditing)
                        .onTapGesture(action: {
                            viewModel.tappedCharacter = char
                            isCharacterSheetPresented.toggle()
                        })
                        .listRowBackground(Color.clear)
                    }
                } header: {
                    if let race = races.first {
                        Text(race.race.rawValue).foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                }
                .sheet(isPresented: $isCharacterSheetPresented,onDismiss: {
                    print(viewModel.tappedCharacter)
                }, content: {
                    CharacterView(character: $viewModel.tappedCharacter)
                })
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
    
    var menuPicker: some View {
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
            Button("Edit") {
                withAnimation {
                    viewModel.selectedChars = []
                    self.viewModel.isEditing.toggle()
                }
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title)
        }
    }
    
    var okButton: some View {
        Button("OK") {
            withAnimation {
                viewModel.selectedChars = []
                self.viewModel.isEditing.toggle()
            }
        }.font(.title2)
    }
    
}

#Preview {
        ListView()
}
