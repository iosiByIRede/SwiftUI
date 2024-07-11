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
        if let imageUrl = char.image {
            imageUrl
                .rpgImageStyle()
        } else {
            char.rpgClass.defaultImage
                .rpgImageStyleDefault(color: char.race.color)
        }
    }
    
    var body: some View {
        ZStack {
            Color.rpgDarkBrown
                .clipShape(.rect(cornerRadius: 10))
            imgChar
            
        }
        .frame(width: 80, height: 80)
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
            .frame(width: 20, height: 20)
            .padding(-8)
            .overlay {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title2)
                }
            }
    }
}

#Preview {
    ZStack {
        ImageBackgroundView()
        ImageCharacter(
            char: Character(
                image: Image(systemName: "rpg"),
                name: "algo",
                rpgClass: .archer,
                race: .dwarf,
                description: "Descr"
            ),
            isSelectMode: true,
            isSelected: true
        )
    }
}
