//
//  CharacterListViewModelk.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

@Observable
class CharacterListViewModel {
    
    var characters: [Character] = [
        Character(name: "Ragnar", rpgClass: .archer, race: .dwarf),
        Character(name: "Ryuk", rpgClass: .blacksmith, race: .elf),
        Character(name: "Shori", rpgClass: .mage, race: .human),
        Character(name: "Witz", rpgClass: .merchant, race: .orc),
        Character(name: "Zakre", rpgClass: .swordsman, race: .dwarf),
    ]

    private func returnRandomChar() -> Character {

        let classes: [RPGClass] = [
            .archer,
            .blacksmith,
            .mage,
            .merchant,
            .novice,
            .swordsman
        ]
        let races: [Race] = [
            .dwarf,
            .elf,
            .human,
            .orc
        ]
        let names: [String] = [
            "Aldric", "Branwen", "Cedric", "Darian", "Elowen", "Fendrel", "Gwyneth", "Haldor",
            "Isolde", "Jareth", "Kael", "Liora", "Merrick", "Nyssa", "Orin", "Perrin", "Quinlan",
            "Rowena", "Sorin", "Thalia", "Ulric", "Vesper", "Wren", "Xander", "Yara", "Zephyr",
            "Aeliana", "Brom", "Calyx", "Drystan", "Eira", "Finnian", "Gareth", "Hesper", "Ivor",
            "Jocasta", "Kendra", "Leoric", "Meliora", "Nerissa", "Oberon", "Phelan", "Quorra",
            "Roderick", "Sable", "Taliesin", "Ursula", "Viggo", "Willow", "Xanthos", "Yelena", "Zarek",
            "Alaric", "Briar", "Cassandra", "Doran", "Elysia", "Falkor", "Galen", "Helena", "Ishmael",
            "Julian", "Kaida", "Lysandra", "Morgana", "Nyle", "Ophelia", "Pax", "Quillon", "Reyna",
            "Sable", "Torian", "Ulrich", "Varian", "Wulfric", "Xenia", "Ysolde", "Zan",
            "Aisling", "Balinor", "Caelum", "Draven", "Elara", "Ferox", "Gavriel", "Harkin", "Ilara",
            "Jorah", "Karis", "Lothar", "Maelis", "Nerida", "Orian", "Persephone", "Quintus",
            "Ravenna", "Selene", "Thorin", "Uriel", "Vara", "Wynter", "Xara", "Yorick", "Zara",
            "Aric", "Bryn", "Corwin", "Dashiell", "Evadne", "Faelan", "Giselle", "Horus", "Islay",
            "Jax", "Korrin", "Luna", "Mara", "Nashira", "Odin", "Phineas", "Quincy", "Rohan",
            "Soren", "Tamsin", "Ulysses", "Vale", "Wynn", "Xanthe", "Ysabella", "Zaden",
            "Aldwin", "Bellamy", "Catriona", "Dagon", "Elara", "Faustus", "Garrett", "Haldir", "Ivanna",
            "Jareth", "Kyra", "Lirael", "Maddox", "Nyx", "Orelia", "Phoenix", "Quinn", "Rhiannon",
            "Sylas", "Talon", "Ulfric", "Valeria", "Wyn", "Xenia", "Yara", "Zane",
            "Arianna", "Bastian", "Cyrus", "Dracaena", "Eowyn", "Fenris", "Gideon", "Hespera", "Isolde",
            "Jasper", "Kaelin", "Lyra", "Maeve", "Niamh", "Orin", "Peregrine", "Quintessa", "Ronan",
            "Seraphina", "Taran", "Ulrika", "Valen", "Willa", "Xanther", "Ysabel", "Zarek",
            "Auron", "Blythe", "Cassian", "Damaris", "Elric", "Finn", "Gwen", "Halvard", "Iskra",
            "Jareth", "Kiera", "Leif", "Magnus", "Nyssa", "Oberyn", "Patrin", "Quorra", "Ryker",
            "Selene", "Thorne", "Ulric", "Vespera", "Willow", "Xander", "Yvonne", "Zander"
        ]
        return Character( name: names.randomElement() ?? "", rpgClass: classes.randomElement() ?? .archer, race: races.randomElement() ?? .dwarf)
    }
    
}
