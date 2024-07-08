//
//  CharacterListViewModelk.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

@Observable
class CharacterListViewModel {
    var searchText: String = ""
    
    var isEditing: Bool = false
    var isGrouped: Bool = false
    var isShowingGroup: Bool = true
    
    var selectedChars: [Character] = []
    
    var getAllRaces: [String] {
        self.isGrouped ? self.allRaces : ["All in one"]
    }
    
    
    func getAllCharacters(_ race: String) -> [Character] {
        if isGrouped {
            return charactersByRace[race] ?? []
        } else {
            return charactersFiltered
        }
    }
    
    func addCharacter() {
        withAnimation {
            characters.insert(returnRandomChar(), at: 0)
        }
    }
    
    func deleteCharacter(in index: IndexSet) {
        characters.remove(atOffsets: index)
    }
    
    func deleteSelectedChars() {
        withAnimation {
            characters.removeAll { character in
                selectedChars.contains(character)
            }
        }
    }
    
    private var allRaces: [String] {Array(charactersByRace.keys.sorted())}
    
    var charactersFiltered: [Character] {
        characters.filter {
            if self.searchText != "" {
                return $0.name.localizedCaseInsensitiveContains(self.searchText)
            } else {
                return true
            }
        }
    }
    
    private var charactersByRace: [String: [Character]] {
        
        var characterByRace: [String: [Character]] = [:]
        
        charactersFiltered.forEach{ char in
            // Caso já tenha essa chave no Array basta adicionar o Character
            if(characterByRace.keys.contains(char.race.rawValue)){
                
                characterByRace[char.race.rawValue]?.append(char)
                // Caso não tenha, cria essa chave com o novo char
            } else {
                
                characterByRace[char.race.rawValue] = [char]
                
            }
            
        }
        
        return characterByRace
    }

    private var characters: [Character] = [
        Character( imageURL: "rpg", name: "Aorus Elite", rpgClass: .mage, race: .human ),
        Character( name: "Frieren", rpgClass: .mage, race: .elf ),
        Character( name: "Marquinhos", rpgClass: .swordsman, race: .dwarf ),
        Character( name: "thraee", rpgClass: .mage, race: .orc ),
        Character( name: "Rubens", rpgClass: .merchant, race: .human ),
        Character( name: "Ian", rpgClass: .novice, race: .orc ),
        Character( name: "Caio", rpgClass: .archer, race: .elf ),
        Character( name: "Magno", rpgClass: .mage, race: .human ),
        Character( name: "Pedro Design", rpgClass: .novice, race: .elf ),
        Character( name: "Particípio", rpgClass: .merchant, race: .dwarf),
        Character( name: "Sigma", rpgClass: .mage, race: .elf),
        Character( name: "Sir lick my bulls", rpgClass: .novice, race: .dwarf),
        Character( name: "World destroyer with Love", rpgClass: .swordsman, race: .orc),
        Character( name: "Something Between Human and Table", rpgClass: .blacksmith, race: .orc),
        Character( name: "must hated love", rpgClass: .blacksmith, race: .orc),
        Character( name: "Markov Nikov", rpgClass: .mage, race: .human),
        Character( name: "Bebezã0", rpgClass: .novice, race: .orc),
        Character( name: "Johnson Carl", rpgClass: .mage, race: .orc)
        
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
            "Lindenberg",
            "Luzes",
            "Amanda CrossFox",
            "Ford Ka Rebeixado Turbinado",
            "Marea em ótimo estado (CE)",
            "Fernando Gol Quadrado",
            "BMW 321i",
            "Ricardson",
            "Wesley Opalão",
            "HB20buscar",
            "Ubireudo",
            "Utebo",
            "Matus",
            "Crililo",
            "Renoult Kiwi",
            "Fiat Mobile",
            "John", 
            "Mary",
            "Ford Mustarda",
            "Chevrolet Camarão",
            "Giggles McSnort", 
            "Laughy McLaughface",
            "Apule", 
            "Bardock",
            "Videl",
            "Puar",
            "Mazda RX-7",
            "Toyota AE86",
            "Snicker Doodle",
            "Wheelo", 
            "Raspberry",
            "Toriyama",
            "Honda NSX",
            "Nissan Skyline GT-R",
            "Fizz Buzz",
            "Oats", 
            "Turles",
            "Launch",
            "Bulma's Mom",
            "Ford Model T",
            "Dodge Charger",
            "Gogeta",
            "Carrot Top", 
            "Breeza",
            "Dr. Briefs",
            "Acer",
            "Saibaiman",
            "Spopovich",
            "Volkswagen Beetle",
            "Pontiac Firebird", 
            "Laughterina",
            "Zorn",
            "Jewel",
            "Paprika",
            "Gabriel o Pescador",
            "Liberatus",
            "Lancer",
            "Golf",
            "Mica",
            "GOT the Goat",
            "Marromeno",
            "High Level",
            "Contexto",
            "Pixels",
            "Problem Together",
            "Top Series",
            "Fernanda Fusca", 
            "João Opala",
            "Maria Brasília",
            "Pedro Kombi",
            "Ana Maverick",
            "Lucas Chevette",
            "Carla Corcel",
            "Bruno Variant",
            "Larissa Belina",
            "Marcos Gordini",
            "Paula TL",
            "Ricardo SP2",
            "Julia Passat",
            "Fernando Puma",
            "Sara Karmann Ghia",
            "Eduardo Dodge Dart",
            "Carolina Miura",
            "Gabriel Alfa Romeo",
            "Vanessa Willys",
            "Rafael Simca Chambord",
            "Isabela Itamaraty",
            "Leonardo Rural Willys",
            "Marina Aero Willys",
            "Thiago JK",
            "Aline MP Lafer",
            "Felipe Santa Matilde",
            "Juliana F100",
            "Rogério Galaxy",
            "Patrícia Fuscão", 
            "Carlos Maverick GT",
            "Bianca 147",
            "Alex Monza",
            "Renata Diplomata"
        ]
        return Character( name: names.randomElement() ?? "", rpgClass: classes.randomElement() ?? .archer, race: races.randomElement() ?? .dwarf)
    }
    
}
