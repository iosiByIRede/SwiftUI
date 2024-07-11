//
//  CharacterListViewModelk.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

@Observable
class CharacterListViewModel {
    
    var allChar: [Character] = {
        (0...30).map { _ in .init().randomize() }
    }()
    var sortedRaceChar: [[Character]] {
        let filteredCharacters: [Character] = allChar.filter {
            if self.searchText != "" {
                return $0.name.localizedCaseInsensitiveContains(self.searchText)
            } else {
                return true
            }
        }
        var races: [[Character]] = []
        for race in Race.allCases {
            races.append(filteredCharacters.filter({ $0.race == race }))
        }
        return races
    }
    
    var tappedCharacter: Character = .init()
    var selectedChars: [Character] = []
    var isEditing: Bool = false
    
    var isGrouped: Bool = false
    var isShowing: Bool = true
    var menuIsShowing: Bool = false
    var searchText: String = ""

}

extension Character {
    func randomize() -> Character {
        let rpgClass: RPGClass = .allCases.randomElement() ?? .archer
        let race: Race = [.dwarf,.elf,.human,.orc].randomElement() ?? .dwarf
        var name: String = ""
        (0...8).forEach { _ in  name.append("abcdefghifklmnopqrstuvwxyz".randomElement() ?? "a") }
        return Character(name: name, rpgClass: rpgClass, race: race)
    }
}
