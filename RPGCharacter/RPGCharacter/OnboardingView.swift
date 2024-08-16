//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    @State var isFinishedOnboarding: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image("bricksBG")
                    .resizable()
                
                LinearGradient(colors: [.rpgGrayedBlue, .rpgLightBrown], startPoint: .top, endPoint: .bottom)
                    .opacity(0.7)
            }
            .ignoresSafeArea()
            
            VStack {
                Text(isFinishedOnboarding ? "True" : "False")
                
                Image("OnboardingRPG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Seja bem vindo!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                
                ButtonOnboarding(isFinishedOnboarding: $isFinishedOnboarding)
            }
        }
    }
}

struct ButtonOnboarding: View {
    @Binding var isFinishedOnboarding: Bool
    
    var body: some View {
        Button(action: {isFinishedOnboarding.toggle()}, label: {
            HStack {
                Text("Vamos lá")
                
                Image(systemName: "figure.archery")
            }
            .foregroundStyle(.black)
            .bold()
            .font(.title)
        })
        .padding(20)
        .padding(.horizontal, 40)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
        }
    }
    
}

#Preview {
    OnboardingView()
}
