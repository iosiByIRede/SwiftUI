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
            ImageCharacter(imageUrl: character.imageURL, race: character.race, rpgClass: character.rpgClass)
            
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
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            Spacer()
        }
    }
}

#Preview {
    CardCharacter(character: Character(imageURL: "rpg", name: "name", rpgClass: .archer, race: .dwarf))
}
