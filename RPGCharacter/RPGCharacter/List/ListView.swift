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
        ZStack {
            ImageBackgroundView()
            List {
                CardCharacter(character: Character(name: "first Character", rpgClass: .archer, race: .dwarf), selectedCharacter: .constant([]))
                CardCharacter(character: Character(name: "Second Character", rpgClass: .blacksmith, race: .elf), selectedCharacter: .constant([]))
                CardCharacter(character: Character(name: "third Character", rpgClass: .mage, race: .human), selectedCharacter: .constant([]))
            }
        }
    }
}

#Preview {
    ListView()
}
