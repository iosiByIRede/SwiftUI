//
//  AddingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 02/07/24.
//

import SwiftUI
import PhotosUI

struct NewCharacterView: View {
    @State var newCharacter: Character = .init()
    @State var isShowingFileImporter: Bool = false
    
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
        .fileImporter( isPresented: $isShowingFileImporter, allowedContentTypes: [.image], allowsMultipleSelection: false, onCompletion: {
            (Result) in
            
            do{
                let fileURL = try Result.get()
                self.newCharacter.imageURL = fileURL.first?.absoluteString
                
            }
            catch{
                print("error reading file (error.localizedDescription)")
            }
            
        })
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
        Button(action: {isShowingFileImporter.toggle()}) {
            Circle()
                .foregroundStyle(.gray)
                .overlay{
                    Circle()
                        .stroke()
                        .foregroundStyle(.white)
                        .frame(width: 160, height: 160)
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
        if character.imageURL == nil {
            Image(systemName: character.rpgClass.getDefaultImage())
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.white)
        } else {
            AsyncImage(url: URL(string: character.imageURL!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 160, height: 160)
                .clipShape(Circle())
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
