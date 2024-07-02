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

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                List(viewModel.characters, id: \.name) { char in
                    CardCharacter(character: char)
                        .listRowBackground(Color.white.blur(radius: 100))
                }
                .listRowSpacing(20)
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    ListView()
}
