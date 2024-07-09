//
//  CharacterView.swift
//  RPGCharacter
//
//  Created by Gabriel Santiago on 09/07/24.
//

import SwiftUI

struct CharacterView: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
            screenBackground
            
            VStack{
                
                ZStack{
                    characterImage
                    
                    characterHeader
                        .padding(.top, 249)
                }

                characterDescription
                
                Spacer()
            }
            
        }
    }
    
    var screenBackground: some View {
        VStack(spacing: 0) {
            Image("bricksBG")
                .resizable()
        }
        .overlay {
            LinearGradient(colors: [Color.rpgGrayedBlue, Color.rpgLightBrown], startPoint: .top, endPoint: .bottom)
                .opacity(0.45)
        }
        .ignoresSafeArea()
    }
    
    var characterImage: some View {
        character.image?
            .resizable()
            .shadow(radius: 100)
            .scaledToFill()
            .frame(width: 400, height: 300)
//            .padding(.bo)
            .clipped()
    }
    
    var characterHeader: some View {
        ZStack {
            
            Rectangle()
                .frame(height: 50)
                .foregroundStyle(Color(red: 0, green: 0, blue: 0, opacity: 0.78))
            
            HStack {
                Text(character.name)
                    .padding()
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Text("\(character.rpgClass) \(character.race)")
                    .padding()
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
            }
        }
    }
    
    var characterDescription: some View {
        ZStack {
            Rectangle()
                .overlay {
                    VStack {
                        ScrollView {
                            Text(character.description)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 30)
                                .foregroundStyle(Color.white)
                                .font(.system(size: 21))
                            Spacer()
                        }
                    }
                }
                .foregroundStyle(Color(red: 0.08, green: 0.08, blue: 0.08, opacity: 0.78))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))

        }
    }
    
}

#Preview {
    CharacterView(character: Character(image: Image("rpg"),
                                       name: "Jorgitozan",
                                       rpgClass: .blacksmith,
                                       race: .human,
                                       description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there " ))
}
