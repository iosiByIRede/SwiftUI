//
//  CardCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct CardCharacter: View {
    
    var character: Character
    var isSelectedMode: Bool = false
    
    @Binding var selectedCharacter: [Character]
    
    var isSelected: Bool {
        selectedCharacter.contains(where: { currentChar in
            currentChar == character
        })
    }
    
    var body: some View {
        HStack {
            ImageCharacter(
                char: character,
                isSelectMode: isSelectedMode,
                isSelected: isSelected
            )
            
            VStack(alignment: .leading) {
                Text(character.name.capitalized)
                    .font(.title2)
                HStack {
                    Text(character.race.rawValue.capitalized)
                    Text(character.rpgClass.rawValue.capitalized)
                }
            }
            .foregroundStyle(.white)
            .bold()
            .padding(.leading)
        }
        .onTapGesture {
            tapCard()
        }
    }
    
    func tapCard() {
        if isSelectedMode {
            if isSelected {
                self.selectedCharacter.removeAll(where: {
                    $0 == self.character
                })
            } else {
                self.selectedCharacter.append(character)
            }
        }
    }
}

#Preview {
    ZStack {
        ImageBackgroundView()
        CardCharacter(
            character: Character(
                imageURL: "rpg",
                name: "name",
                rpgClass: .archer,
                race: .dwarf
            ),
            selectedCharacter: .constant([])
        )
    }
}
