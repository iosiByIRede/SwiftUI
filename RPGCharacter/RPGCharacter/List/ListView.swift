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
    var allRaces: [String] {Array(charactersByRace.keys)}
    
    var body: some View {
        ZStack {
            imageBackground
            
            VStack(alignment: .leading) {
                if(!isGrouped){
                    allCharactersList
                        .scrollContentBackground(.hidden)
                }else {
                    groupedList
                        .scrollContentBackground(.hidden)// ISSO DAQUI É MUITO IMPORTANTE
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                }
                
            }
            .overlay(alignment: .topTrailing) {
                Button("Agrupar") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isGrouped.toggle()
                    }
                }
                .padding()
            }
            .overlay(alignment: .topLeading) {
                EditButton()
                    .padding()
            }
        }
    }
    
    var groupedList: some View {
        List {
            ForEach(allRaces, id: \.self) { race in
                
                Section {
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
                .padding()
                .listRowBackground(Color.clear)
        }
    }
    
    var imageBackground: some View {
        Image("bricksBG")
            .resizable()
            .overlay {
                LinearGradient(colors: [Color.rpgGrayedBlue, Color.rpgLightBrown], startPoint: .top, endPoint: .bottom)
                    .opacity(0.75)
            }
            .ignoresSafeArea()
    }
    
}

#Preview {
    ListView()
}
