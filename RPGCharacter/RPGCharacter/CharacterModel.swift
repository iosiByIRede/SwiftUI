//
//  CharacterModel.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 03/07/24.
//

import SwiftUI

struct Character {
    var image: Image?
    var name: String = "New Character"
    var rpgClass: RPGClass = .none
    var race: Race = .none
    var description: String = ""
}

enum RPGClass: String, CaseIterable {
    case none
    case novice
    case swordsman
    case archer
    case mage
    case merchant
    case blacksmith
    
    func getDefaultImage() -> String{
        switch self {
        case .archer:
            return "scope"
        case .blacksmith:
            return "hammer.fill"
        case .mage:
            return "book.fill"
        case .swordsman:
            return "shield.fill"
        case .novice:
            return "cross.fill"
        case .merchant:
            return "backpack"
        case .none:
            return "person.fill"
        }
    }
    
}

enum Race: String, CaseIterable {
    case none
    case human
    case elf
    case dwarf
    case orc
}
