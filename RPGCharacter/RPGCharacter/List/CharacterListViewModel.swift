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
            image: Image(systemName: "heart.fill"),
            name: "AorusElite",
            career: .mage,
            race: .human
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Frieren",
            career: .mage,
            race: .elf
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Marquinhos",
            career: .swordsman,
            race: .dwarf
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "thraee",
            career: .mage,
            race: .orc
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Rubens",
            career: .merchant,
            race: .human
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Ian",
            career: .novice,
            race: .orc
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Caio",
            career: .archer,
            race: .elf
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Magno",
            career: .mage,
            race: .human
        ),
        Character(
            image: Image(systemName: "heart.fill"),
            name: "Pedro Design",
            career: .novice,
            race: .elf
        ),
        
    ]
}
