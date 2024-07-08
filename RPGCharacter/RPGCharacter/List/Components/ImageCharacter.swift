//
//  ImageCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 04/07/24.
//

import SwiftUI

struct ImageCharacter: View {
    var char: Character
    var isSelectMode: Bool = false
    var isSelected: Bool = false
    
    @ViewBuilder var imgChar: some View {
        if let image = char.image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            Image(systemName: char.rpgClass.defaultImage)
                .resizable()
                .scaledToFit()
                .padding(10)
                .foregroundStyle(char.race.color)
                .frame(width: 75, height: 75)
        }
    }
    
    var body: some View {
        ZStack {
            Color.rpgDarkBrown
                .clipShape(.rect(cornerRadius: 10))
            imgChar
            
        }
        .frame(width: 100, height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(char.race.color, lineWidth: 2)
        )
        .overlay(alignment: .topTrailing) {
            if isSelectMode {
                selectCircle
            }
        }
    }
    
    var selectCircle: some View {
        Circle()
            .fill(Color("rpgGrayedBlue"))
            .frame(width: 30, height: 30)
            .padding(-8)
            .overlay {
                if self.isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title)
                }
            }
    }
}

#Preview {
    ZStack {
        ImageCharacter(
            char: Character(
                image: Image("rpg"),
                name: "algo",
                rpgClass: .archer,
                race: .dwarf,
                description: "Descr"
            ),
            isSelectMode: true,
            isSelected: true
        )
    }
    .padding()
    .background {
        Color.blue
    }
}
