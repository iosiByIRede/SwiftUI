//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 25/06/24.
//

import SwiftUI

// Utilizar apenas na intro e comentar para componentização
struct OnboardingView: View {
    var imageName = "rpg"
    var title = "Bem-vindo"
    var description = "Descrição da primeira tela"
    
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 20))
                .frame(height: 300)
                
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }.foregroundStyle(.white)
        .padding()
        .background(LinearGradient(
            colors: [
                Color.rpgLightBrown,
                Color.rpgBrown,
                Color.rpgGrayedBlue
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all))
    }
}

// Descomentar para usar em componentização
//struct OnboardingView: View {
//    var body: some View {
//        TabView {
//            OnboardingPage(imageName: "rpg", title: "Bem-vindo!", description: "Descrição da primeira tela.")
//            OnboardingPage(imageName: "rpg", title: "Explore!", description: "Descrição da segunda tela.")
//            OnboardingFinalPage(imageName: "rpg", title: "Descubra!", description: "Descrição da terceira tela.")
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .ignoresSafeArea()
//    }
//}

//Adicionar na etapa de componentização
//struct OnboardingPage: View {
//    var imageName: String
//    var title: String
//    var description: String
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(.rect(cornerRadius: 20))
//                .frame(height: 300)
//
//            Spacer()
//            Text(title)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.bottom, 20)
//            Text(description)
//                .font(.body)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            Spacer()
//        }.foregroundStyle(.white)
//        .padding()
//        .background(LinearGradient(
//            colors: [
//                Color.rpgLightBrown,
//                Color.rpgBrown,
//                Color.rpgGrayedBlue
//            ],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(.all))
//    }
//}
//
//// Adicionar na etapa de nagevação
//struct OnboardingFinalPage: View {
//    var imageName: String
//    var title: String
//    var description: String
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(.rect(cornerRadius: 20))
//                .frame(height: 300)
//
//            Spacer()
//            Text(title)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.bottom, 20)
//            Text(description)
//                .font(.body)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            Spacer()
//            Button("Final") {
//                print("Ok")
//            }
//            Spacer()
//        }.foregroundStyle(.white)
//        .padding()
//        .background(LinearGradient(
//            colors: [
//                Color.rpgLightBrown,
//                Color.rpgBrown,
//                Color.rpgGrayedBlue
//            ],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(.all))
//    }
//}

#Preview {
    OnboardingView()
}
