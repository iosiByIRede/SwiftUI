//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: CharacterListViewModel = CharacterListViewModel()
    
    @State var isGrouped: Bool = false
    @State var isShowing: Bool = true
    @State var menuIsShowing: Bool = false
    @State var qualquer: String = ""
    
    var charactersByRace: [String: [Character]] {
        var characterByRace: [String: [Character]] = [:]
        viewModel.characters.forEach { character in
            if(characterByRace.keys.contains(character.race.rawValue)){
                characterByRace[character.race.rawValue]?.append(character)
            }else {
                characterByRace[character.race.rawValue] = [character]
            }
        }
        return characterByRace
    } // Isso deveria ir pra VM, mas, deixo aqui?
    var allRaces: [String] {Array(charactersByRace.keys.sorted())}
    
    var body: some View {
        ZStack {
            imageBackground
            VStack() {
                if(!isGrouped){
                    allCharactersList
                        .scrollContentBackground(.hidden)
                        .padding(.top, 60)
                } else {
                    groupedList
                        .scrollContentBackground(.hidden)// ISSO DAQUI É MUITO IMPORTANTE
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                        .padding(.top, 20)
                }
                
            }
            .overlay(alignment: .topTrailing) {
                Menu(content: {
                    Button("Agrupar") {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isGrouped.toggle()
                        }
                    }
                    Button("Colapsar") {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isShowing.toggle()
                        }
                    }
                    .disabled(!isGrouped)
                    EditButton()
                        .disabled(true)
                    
                }, label: {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 26, height: 26)
//                        .padding()
                })
            }
            .overlay(alignment: .top) {
                HStack{
                    TextField(text: $qualquer) {
                        Text("Comida")
                    }// Acho que dá pra colocar na overlayer
//                    .padding()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 40)
                .background(Color.black.opacity(0.5))
                .cornerRadius(20)
//                .padding(.top, 8)
            }
        }
    }
    
    var groupedList: some View {
        List {
            ForEach(allRaces, id: \.self) { race in
                Section(isExpanded: $isShowing) {
                    ForEach(charactersByRace[race] ?? [], id:\.name){ char in
                        CardCharacter(character: char)
                            .listRowBackground(Color.clear)
                    }
                } header: {
                    Text(race).foregroundColor(.white)
                        .font(.title)
                }
            }
        }
    }
    
    var allCharactersList: some View {
        List(viewModel.characters, id: \.name) { char in
            CardCharacter(character: char)
                .listRowBackground(Color.clear)
        }
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
    NavigationStack{
        ListView()
    }
}
