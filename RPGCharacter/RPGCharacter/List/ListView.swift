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
    init() {
            // Customize the appearance of the navigation bar
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
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                List(viewModel.characters, id: \.name) { char in
                    CardCharacter(character: char)
                        .padding()
                        .listRowBackground(Color.brown.blur(radius: 50))
                }
                .listStyle(.plain)
                .listRowSpacing(10)
                .background(Color.clear)
                
            }
            .background(Color.clear)
            .toolbar(content: {
                ToolbarItem(id: "vish", placement: .topBarLeading) {
                    EditButton()
                }
            })
        }
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
    .background(Color.clear)
}
