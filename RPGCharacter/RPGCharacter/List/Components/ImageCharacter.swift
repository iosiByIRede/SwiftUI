//
//  ImageCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 04/07/24.
//

import SwiftUI

struct ImageCharacter: View {
    var imageUrl: String?
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
        if let imageUrl {
            return Image(imageUrl)
        }
        return Image(systemName: rpgClass.getDefaultImage())
    }
    var rpgClass: RPGClass
    var body: some View {
        VStack{
            if(imageUrl != nil){
                imgChar
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }else {
                imgChar
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .foregroundStyle(borderColor)
                    .frame(width: 75, height: 75)
            }
        }
        .frame(width: 100, height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 2)
        )
        .background(
            Color.rpgDarkBrown
                .cornerRadius(10)
        )
    }
}

#Preview {
    ZStack {
        ImageCharacter(imageUrl: "rpg", race: .dwarf, rpgClass: .archer)
    }
    .padding()
    .background {
            Color.blue
        }
}
