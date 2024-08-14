//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        LinearGradient(colors: [.rpgDarkBlue, .rpgGrayedBlue, .rpgBlack, .red], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
