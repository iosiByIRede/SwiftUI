//
//  CharacterListViewModelk.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

class CharacterListViewModel: ObservableObject {
    var characters: [Character] = [
        Character(
            name: "AorusElite",
            rpgClass: .mage,
            race: .human
        ),
        Character(
            name: "Frieren",
            rpgClass: .mage,
            race: .elf
        ),
        Character(
            name: "Marquinhos",
            rpgClass: .swordsman,
            race: .dwarf
        ),
        Character(
            name: "thraee",
            rpgClass: .mage,
            race: .orc
        ),
        Character(
            name: "Rubens",
            rpgClass: .merchant,
            race: .human
        ),
        Character(
            name: "Ian",
            rpgClass: .novice,
            race: .orc
        ),
        Character(
            name: "Caio",
            rpgClass: .archer,
            race: .elf
        ),
        Character(
            name: "Magno",
            rpgClass: .mage,
            race: .human
        ),
        Character(
            name: "Pedro Design",
            rpgClass: .novice,
            race: .elf
        ),
        
    ]
}
