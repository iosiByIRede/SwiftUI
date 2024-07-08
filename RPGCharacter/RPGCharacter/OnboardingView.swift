//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 25/06/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingPage(imageName: "rpg", title: "Bem-vindo!", description: "Crie Personagens para suas mesas de RPG!")
            OnboardingPage(imageName: "rpg", title: "Organize!", description: "Garanta uma organização e controle muito maior.")
            OnboardingFinalPage(imageName: "rpg", title: "Explore!", description: "Está pronto para aventura!?")
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct OnboardingPage: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        ZStack {
            RPGBackground()
            VStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
                    .frame(height: 300)
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

struct OnboardingFinalPage: View {
    var imageName: String
    var title: String
    var description: String
    @AppStorage(Keys.didOnboarding) var didOnboarding: Bool = false

    var body: some View {
        OnboardingPage(imageName: imageName,
                       title: title,
                       description: description)
        .overlay(alignment: .bottom) {
            Button(action: {
                didOnboarding = true
            }, label: {
                ZStack {
                    Rectangle()
                        .fill(Color("rpgBlack"))
                    Label("Começar a Criar", systemImage: "figure.archery")
                }
                .frame(height: 64)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal)
            })
            .foregroundStyle(.white)
            .padding(30)
        }
    }
}

#Preview {
    OnboardingView()
}
