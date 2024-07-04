//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct RPGBackground: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [
                Color.rpgLightBrown,
                Color.rpgBrown,
                Color.rpgGrayedBlue
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            Rectangle()
                .fill(.clear)
                .background(.regularMaterial)
        }
    }
}

struct ListView: View {
    @ObservedObject var viewModel: CharacterListViewModel = CharacterListViewModel()
    
    @State var isGrouped: Bool = false
    
    var tentativa: [String: [Character]]{
        var algo: [String: [Character]] = [:]
        viewModel.characters.forEach { character in
            if(algo.keys.contains(character.race.rawValue)){
                algo[character.race.rawValue]?.append(character)
            }else {
                algo[character.race.rawValue] = [character]
            }
        }
        return algo
    }
    var allRaces: [String] {Array(tentativa.keys)}
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            Image("bricksBG")
                .resizable()
            
                .overlay {
                    LinearGradient(colors: [Color.rpgGrayedBlue, Color.rpgLightBrown], startPoint: .top, endPoint: .bottom)
                        .opacity(0.75)
                }
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                if(!isGrouped){
                    List(viewModel.characters, id: \.name) { char in
                        CardCharacter(character: char)
                            .padding()
                            .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                }else {
                    
                    List {
                        
                        ForEach(allRaces, id: \.self) { race in
                            Section(header: Text(race).foregroundColor(.white)
                                .font(.title)) {
                                    ForEach(tentativa[race] ?? [], id:\.name){ char in
                                        CardCharacter(character: char)
                                        
                                            .listRowBackground(Color.clear)
                                    }
                                }
                        }
                    }
                    .scrollContentBackground(.hidden)// ISSO DAQUI É MUITO IMPORTANTE
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()// Personalizar esse botão
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Agrupar") {
                        withAnimation(.bouncy(duration: 1)) {
                            isGrouped.toggle()
                        }
                    }
                }
            })
        }
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}
