//
//  EditCharacterView.swift
//  RPGCharacter
//
//  Created by Gabriel Santiago on 10/07/24.
//

import SwiftUI
import PhotosUI

struct EditCharacterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var editedCharacter: Character
    @State var pickerItem: PhotosPickerItem?
    
    @State var classSelection: String = "None"
    @State var raceSelection: String = "None"
    
    var body: some View {
        ZStack {
            
            screenBackground
            
            VStack(alignment: .center) {
                
                characterImage
                
                doneButton
                
                Form {
                    Group {
                        characterNameForm
                        
                        characterClassForm
                        
                        characterRaceForm
                        
                        characterDescriptionForm
                    }
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            }
        }
        .onChange(of: pickerItem) {
                    Task {
                        if let loaded = try? await pickerItem?.loadTransferable(type: Image.self) {
                            editedCharacter.image = loaded
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
            LinearGradient(colors: [Color.rpgBrown, Color.rpgBlack], startPoint: .top, endPoint: .bottom)
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
                    getCharacterImage(character: editedCharacter)
                }
        }
        .frame(width: 160, height: 160)
    }
    
    var characterNameForm: some View {
        
        RPGTextField(title: "CHARACTER NAME:", text: $editedCharacter.name)
    }
    
    var characterClassForm: some View {
        
        RPGPicker(title: "CHARACTER CLASS",
                  selection: $classSelection,
                  options: RPGClass.allCases.map({$0.rawValue.capitalized}))
    }
    
    var characterRaceForm: some View {
        
        RPGPicker(title: "CHARACTER RACE",
                  selection: $raceSelection,
                  options: Race.allCases.map({$0.rawValue.capitalized}))
    }
    
    var characterDescriptionForm: some View {
        
        RPGTextField(title: "DESCRIPTION",
                     text: $editedCharacter.description,
                     isMultiline: true)
    }
    
    var doneButton: some View {
        Button(action: {
            createCharacter(character: editedCharacter)
            dismiss()
        }){
            Image(systemName: "trash")
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
    
    func createCharacter(character: Character) {
        let newCharacterClass: RPGClass = RPGClass(rawValue: classSelection.lowercased()) ?? .none
        
        let newCharacterRace: Race = Race(rawValue: raceSelection.lowercased()) ?? .none
        
        editedCharacter.rpgClass = newCharacterClass
        editedCharacter.race = newCharacterRace
        
    }
}

//#Preview {
//    EditCharacterView(editedCharacter: Character(image: Image("rpg"),
//                                       name: "Jorgitozan",
//                                       rpgClass: .blacksmith,
//                                       race: .human,
//                                       description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there " ))
//}
