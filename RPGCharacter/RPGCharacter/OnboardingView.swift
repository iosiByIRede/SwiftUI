//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
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
                Image("OnboardingRPG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Seja bem vindo!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                
                Button(action: {}, label: {
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
    }
}

#Preview {
    OnboardingView()
}
