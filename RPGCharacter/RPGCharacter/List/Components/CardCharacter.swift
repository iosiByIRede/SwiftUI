//
//  CardCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct CardCharacter: View {
    var character: Character
    
    var body: some View {
        HStack(alignment: .center) {
            ImageCharacter(image: character.image, race: character.race, rpgClass: character.rpgClass)
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title2)
                HStack {
                    Text("race:")
                        .font(.headline)
                    Text(character.race.rawValue)
                }
                HStack{
                    Text("class:")
                        .font(.headline)
                    Text(character.rpgClass.rawValue)
                }
            }
            
            .padding()
            Spacer()
        }
    }
}

struct ImageCharacter: View {
    var image: Image?
    var race: Race
    var borderColor: Color {
        switch race {
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
    var imgChar: Image {
        if let image {
            return image
        }
        return Image(systemName: rpgClass.getDefaultImage())
    }
    var rpgClass: RPGClass
    var body: some View {
        VStack{
            imgChar
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 4)
        )
    }
}
#Preview {
    CardCharacter(character: Character(image: Image(systemName: "heart.fill"), name: "name", rpgClass: .archer, race: .dwarf))
}
