//
//  Character.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct Character {
    var image: Image
    var name: String
    var career: RPGClass
    var race: Race
}

enum RPGClass {
    case novice
    case swordsman
    case archer
    case mage
    case merchant
}

enum Race {
    case human
    case elf
    case dwarf
    case orc
}
