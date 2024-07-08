//
//  CardCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct CardCharacter: View {
    var character: Character
    @Binding var selectedCharacter: [Character]
    var isSelected: Bool {
        selectedCharacter.contains(where: {
            $0 == character
        })
    }
    var isSelectedMode: Bool = false
    var borderColor: Color {
        character.race.color
    }
    
    init(character: Character,
         selectedCharacter: Binding<[Character]> = .constant([]),
         isSelectedMode: Bool = true) {
        self.character = character
        self._selectedCharacter = selectedCharacter
        self.isSelectedMode = isSelectedMode
    }
    
    var body: some View {
        HStack {
            ImageCharacter(image: character.image,
                           race: character.race,
                           rpgClass: character.rpgClass,
                           isSelectMode: self.isSelectedMode,
                           isSelected: self.isSelected)
            VStack(alignment: .leading) {
                Text(character.name.capitalized)
                    .font(.title)
                HStack {
                    Text(character.race.rawValue.capitalized)
                    Text(character.rpgClass.rawValue.capitalized)
                }
            }
            .foregroundStyle(.white)
            .bold()
            .padding(.leading)
            Spacer()
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
    CardCharacter(character: Character(image: .init(.rpg), name: "name", rpgClass: .archer, race: .dwarf))
        .background {
            Color.black
        }
}
