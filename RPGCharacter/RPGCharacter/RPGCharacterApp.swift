//
//  RPGCharacterApp.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 25/06/24.
//

import SwiftUI

@main
struct RPGCharacterApp: App {
    
    @AppStorage("didFirstSession") var didFirstSession: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if didFirstSession {
                ListView()
            } else {
                OnboardingView()
            }
        }
    }
}
