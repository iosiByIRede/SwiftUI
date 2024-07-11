//
//  CharacterView.swift
//  RPGCharacter
//
//  Created by Gabriel Santiago on 09/07/24.
//

import SwiftUI

struct CharacterView: View {
    
    @Binding var character: Character
    
    @State var isEditScreenShowing = false
    
    var body: some View {
        ZStack {
            screenBackground
            
            VStack{
                
                ZStack{
                    characterImage
                        .padding(.top, -7)
                    
                    editButton
                    
                    characterHeader
                        .padding(.top, 249)
                }

                characterDescription
                
                Spacer()
            }
            
        }
    }
    
    var editButton: some View {
        Button(action: {
            self.isEditScreenShowing.toggle()
        }) {
            Circle()
                .overlay {
                    Image(systemName: "slider.vertical.3")
                        .resizable()
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 12)
                }
                .foregroundStyle(Color(red: 0, green: 0, blue: 0, opacity: 0.60))
                .frame(width: 43, height: 43)
        }
        .padding(.leading, 330)
        .padding(.bottom, 234)
        .fullScreenCover(isPresented: $isEditScreenShowing, content: {
            EditCharacterView(editedCharacter: $character)
        })
    }
    
    var screenBackground: some View {
        VStack(spacing: 0) {
            Image("bricksBG")
                .resizable()
        }
        .overlay {
            LinearGradient(colors: [Color.rpgBrown, Color.rpgDarkBrown], startPoint: .top, endPoint: .bottom)
                .opacity(0.45)
        }
        .ignoresSafeArea()
    }
    
    var characterImage: some View {
        setCharacterImage(with: character)
    }
    
    
    
    var characterHeader: some View {
        ZStack {
            
            Rectangle()
                .frame(height: 52)
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
                            setDescriptionLayout(with: character)
                        }
                    }
                }
                .foregroundStyle(Color(red: 0.08, green: 0.08, blue: 0.08, opacity: 0.78))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))

        }
    }
    
    @ViewBuilder func setCharacterImage(with character: Character) -> some View {
        if let unwrappedImage = character.image {
            unwrappedImage
                .resizable()
                .shadow(radius: 100)
                .scaledToFill()
                .frame(width: 400, height: 300)
                .clipped()
        } else {
            Image(systemName: character.rpgClass.getDefaultImage())
                .resizable()
                .foregroundStyle(Color(character.race.color))
                .shadow(radius: 100)
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipped()
        }
    }
    
    @ViewBuilder func setDescriptionLayout(with character: Character) -> some View {
        if character.description != "" {
            Text(character.description)
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                .foregroundStyle(Color.white)
                .font(.system(size: 21))
                .italic()
        } else {
            Text("no description available")
                .padding(.horizontal, 30)
                .padding(.vertical, 190)
                .foregroundStyle(Color.white)
                .font(.system(size: 21))
        }
        
    }
}

//#Preview {
//    CharacterView(character: Character(image: Image("rpg"),
//                                       name: "Jorgitozan",
//                                       rpgClass: .blacksmith,
//                                       race: .human,
//                                       description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there " ))
//}
