//
//  CardCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct CardCharacter: View {
    var character: Character
    var borderColor: Color {
        switch character.race {
        case .dwarf:
            return .yellow
        case .elf:
            return .green
        case .human:
            return .blue
        case .orc:
            return .brown
        default:
            return .black
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ImageCharacter(imageUrl: character.imageURL, race: character.race, rpgClass: character.rpgClass)
            
            VStack(alignment: .leading) {
                Text(character.name.capitalized)
                    .font(.title)
                HStack {
                    Text(character.race.rawValue.capitalized)
                    Text(character.rpgClass.rawValue.capitalized)
                }
//                .padding()
//                HStack {
//                    Text("race:")
//                        .font(.headline)
//                    Text(character.race.rawValue)
//                }
//                HStack{
//                    Text("class:")
//                        .font(.headline)
//                    Text(character.rpgClass.rawValue)
//                }
            }
            .foregroundStyle(.white)
            .bold()
//            .shadow(color: .white, radius: 1)
            
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            Spacer()
        }
    }
}

#Preview {
    CardCharacter(character: Character(imageURL: "rpg", name: "name", rpgClass: .archer, race: .dwarf))
        .background {
            Color.black
        }
}
