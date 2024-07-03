//
//  AddingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 02/07/24.
//

import SwiftUI

enum Classes: String, CaseIterable {
    case none = "None"
    case mage = "Mage"
    case rogue = "Rogue"
}

enum Races: String, CaseIterable {
    case none = "None"
    case human = "Human"
    case orc = "Orc"
}

struct NewCharacterView: View {
    @State var selectedImage: Image = .init(systemName: "person.fill")
    @State var characterName: String = "New Character"
    @State var characterClass: Classes = .none
    @State var characterRace: Races = .none
    @State var characterDescription: String = ""
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                Image("bricksBG")
                    .resizable()
            }
            .overlay {
                LinearGradient(colors: [Color.rpgGrayedBlue, Color.rpgLightBrown], startPoint: .top, endPoint: .bottom)
                    .opacity(0.75)
            }
            .ignoresSafeArea()

            
            VStack(alignment: .center) {
                characterImage
                Form {
                    
                    characterNameForm
                    
                    characterClassForm
                    
                    characterRaceForm
                    
                    Section {
                        TextField(text: $characterDescription, axis: .vertical) {
                            Text("Character Description")
                        }
                        .foregroundStyle(.black)
                        .fontWeight(.regular)
                        .lineLimit(5...10)
                    } header: {
                        Text("Description")
                    }

                }
                .formStyle(.automatic)
                .padding(.horizontal, 40)
                .scrollContentBackground(.hidden)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            }
            
            VStack {
                Spacer()
                
                completionButton
                .disabled(true)
            }
        }
    }
    
    var characterImage: some View {
        Circle()
            .foregroundStyle(.gray)
            .frame(width: 160, height: 160)
            .overlay{
                Circle()
                    .stroke()
                    .foregroundStyle(.white)
                    .frame(width: 160, height: 160)
            }
            .overlay {
                selectedImage
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .foregroundStyle(.white)
            }
    }
    
    var characterNameForm: some View {
        Section {
            TextField(text: $characterName) {
                Text("Character Name")
            }
            .foregroundStyle(.black)
            .fontWeight(.regular)
        } header: {
            Text("Character Name:")
        }
    }
    
    var characterClassForm: some View {
        Section {
            Picker(selection: $characterClass) {
                ForEach(Classes.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            } label: {
                Text(characterClass.rawValue)
                    .foregroundStyle(.black)
                    .fontWeight(.regular)
            }

        } header: {
            Text("Character Class:")
        }
    }
    
    var characterRaceForm: some View {
        Section {
            Picker(selection: $characterRace) {
                ForEach(Races.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            } label: {
                Text(characterRace.rawValue)
                    .foregroundStyle(.black)
                    .fontWeight(.regular)
            }

        } header: {
            Text("Character Race:")
        }
    }
    
    var completionButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .frame(height: 80)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    NewCharacterView()
}
