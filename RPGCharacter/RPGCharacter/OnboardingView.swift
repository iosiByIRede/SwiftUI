//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10)
        } placeholder: {
            Text("Carregando")
        }

    }
}

#Preview {
    OnboardingView()
}
