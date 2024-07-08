//
//  RPGCharacterApp.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 25/06/24.
//

import SwiftUI

@main
struct RPGCharacterApp: App {
    
    @AppStorage(Keys.didOnboarding) var didOnboarding = false
    
    
    var body: some Scene {
        WindowGroup {
            if didOnboarding {
                NavigationStack {
                    ListView()
                }
            } else {
                OnboardingView()
            }
        }
    }
}

class Keys {
    
    static let didOnboarding: String = "didOnboarding"
    static let path: String = "path"
    static let updateCharacter: String = "updateCharacter"
    static let character: String = "character"
    
}

enum NavigationKeyPaths: String, Hashable {
    
    case list
    case add
    case character
    
}
