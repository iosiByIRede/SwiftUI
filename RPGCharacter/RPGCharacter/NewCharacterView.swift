//
//  NewCharacterView.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 05/07/24.
//

import SwiftUI
import PhotosUI

struct NewCharacterView: View {
    @State var newCharacter: Character = .init()
    @State var pickerItem: PhotosPickerItem?
    
    var body: some View {
        ZStack {
            
            screenBackground
            
            VStack(alignment: .center) {
                
                characterImage
                
                Form {
                    
                    characterNameForm
                    
                    characterClassForm
                    
                    characterRaceForm
                    
                    characterDescriptionForm

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
            }
        }
        .onChange(of: pickerItem) {
                    Task {
                        if let loaded = try? await pickerItem?.loadTransferable(type: Image.self) {
                            newCharacter.image = loaded
                        } else {
                            print("Failed")
                        }
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
        PhotosPicker(selection: $pickerItem, matching: .not(.videos)) {
            Circle()
                .foregroundStyle(.gray)
                .overlay{
                    Circle()
                        .stroke()
                        .foregroundStyle(.white)
                }
                .overlay {
                    getCharacterImage(character: newCharacter)
                }
        }
        .frame(width: 160, height: 160)
    }
    
    var characterNameForm: some View {
        Section {
            TextField(text: $newCharacter.name) {
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
            Picker(selection: $newCharacter.rpgClass) {
                ForEach(RPGClass.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            } label: {
                Text(newCharacter.rpgClass.rawValue)
                    .foregroundStyle(.black)
                    .fontWeight(.regular)
            }

        } header: {
            Text("Character Class:")
        }
    }
    
    var characterRaceForm: some View {
        Section {
            Picker(selection: $newCharacter.race) {
                ForEach(Race.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            } label: {
                Text(newCharacter.race.rawValue)
                    .foregroundStyle(.black)
                    .fontWeight(.regular)
            }

        } header: {
            Text("Character Race:")
        }
    }
    
    var characterDescriptionForm: some View {
        Section {
            TextField(text: $newCharacter.description, axis: .vertical) {
                Text("Character Description")
            }
            .foregroundStyle(.black)
            .fontWeight(.regular)
            .lineLimit(5...10)
        } header: {
            Text("Description")
        }
    }
    
    var completionButton: some View {
        Button(action: {createCharacter(character: newCharacter)}) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(checkCharacterData(character: newCharacter) ? .blue : .gray)
                .frame(height: 80)
                .padding(.horizontal, 40)
                .disabled(!checkCharacterData(character: newCharacter))
                .overlay {
                    Text("Criar personagem")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                }
        }
    }
    
    @ViewBuilder func getCharacterImage(character: Character) -> some View {
        if let image =  character.image {
            image
                .resizable()
                .clipShape(Circle())
                .frame(width: 160, height: 160)
            
        } else {
            Image(systemName: character.rpgClass.getDefaultImage())
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
        }
        
    }
    
    func checkCharacterData(character: Character) -> Bool {
        if (character.race == .none || character.rpgClass == .none) {
            return false
        }
        return true
    }
    
    func createCharacter(character: Character) {
        
    }
}

#Preview {
    NewCharacterView()
}
