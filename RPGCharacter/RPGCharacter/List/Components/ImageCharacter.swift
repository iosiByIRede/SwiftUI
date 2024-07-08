//
//  ImageCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 04/07/24.
//

import SwiftUI

struct ImageCharacter: View {
    var image: Image?
    var race: Race
    var borderColor: Color { race.color }
    var rpgClass: RPGClass
    var isSelectMode: Bool = false
    var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            Color.rpgDarkBrown
                .clipShape(.rect(cornerRadius: 10))
            imgChar
        }
        .frame(width: 100, height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 2)
        )
        .overlay(alignment: .topTrailing) {
            if isSelectMode {
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
    }
    
    @ViewBuilder var imgChar: some View {
        if let image {
            image
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            Image(systemName: rpgClass.getDefaultImage())
                .resizable()
                .scaledToFit()
                .padding(10)
                .foregroundStyle(borderColor)
        }
    }
}

#Preview {
    ZStack {
        ImageCharacter(image: .init(.rpg), race: .dwarf, rpgClass: .archer)
    }
    .padding()
}
