//
//  CharacterModel.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 03/07/24.
//

import SwiftUI

struct Character: Identifiable {
    var id: UUID = UUID()
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
    
    var defaultImage: Image {
        switch self {
        case .archer:
            return Image(systemName: "scope")
        case .blacksmith:
            return Image(systemName: "hammer.fill")
        case .mage:
            return Image(systemName: "book.fill")
        case .swordsman:
            return Image(systemName: "shield.fill")
        case .novice:
            return Image(systemName: "cross.fill")
        case .merchant:
            return Image(systemName: "backpack")
        case .none:
            return Image(systemName: "person.fill")
        }
    }
    
}

enum Race: String, CaseIterable {
    case none
    case human
    case elf
    case dwarf
    case orc
    
    var color: Color {
        switch self {
        case .dwarf:
            .yellow
        case .elf:
            .green
        case .human:
            .blue
        case .orc:
            .brown
        default:
            .black
        }
    }
}

extension Character: Equatable {}
