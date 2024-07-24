//
//  CharacterModel.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 03/07/24.
//
/*
 Oi Pessoal, eu sou o Caio e nessa aula vamos aprender a adicionar Sections na nossa lista, vamos dar continuidade ao projeto da aula anterior adicionando uma opção de agrupar os personagens de acordo com sua Raça
 Vamos ver como vai ficar nosso aplicativo no final dessa aula
 */

import SwiftUI

struct Character: Identifiable {
    var id: UUID = UUID()
    var imageURL: String?
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
    
    var defaultImage: String {
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
