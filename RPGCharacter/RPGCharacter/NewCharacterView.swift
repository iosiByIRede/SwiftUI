import SwiftUI
import PhotosUI

struct NewCharacterView: View {
    @State var newCharacter: Character = .init()
    @State var pickerItem: PhotosPickerItem?
    
    @State var classSelection: String = "None"
    @State var raceSelection: String = "None"
    
    var body: some View {
        ZStack {
            
            screenBackground
            
            VStack(alignment: .center) {
                
                characterImage
                
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
        
        RPGTextField(title: "CHARACTER NAME:", text: $newCharacter.name)
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
                     text: $newCharacter.description,
                     isMultiline: true)
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
            newCharacter.rpgClass.defaultImage
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
        let newCharacterClass: RPGClass = RPGClass(rawValue: classSelection.lowercased()) ?? .none
        
        let newCharacterRace: Race = Race(rawValue: raceSelection.lowercased()) ?? .none
        
        newCharacter.rpgClass = newCharacterClass
        newCharacter.race = newCharacterRace
        
    }
}

#Preview {
    NewCharacterView()
}
