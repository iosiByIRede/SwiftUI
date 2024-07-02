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
                character.image
                    .resizable()
                    .frame(width: 40, height: 40)
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
                        Text(character.career.rawValue)
                    }
                }
                
                .padding()
                Spacer()
        }
    }
}

#Preview {
    CardCharacter(character: Character(image: Image(systemName: "heart.fill"), name: "name", career: .archer, race: .dwarf))
}
