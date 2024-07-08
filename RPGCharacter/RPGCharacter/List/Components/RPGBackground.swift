//
//  ImageBackgroundView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 05/07/24.
//

import SwiftUI

struct RPGBackground: View {
    var body: some View {
        Image("bricksBG")
            .resizable()
            .overlay {
                LinearGradient(colors: [Color("rpgGrayedBlue"), Color("rpgLightBrown")], startPoint: .top, endPoint: .bottom)
                    .opacity(0.45)
            }
            .ignoresSafeArea()
    }
}

#Preview {
    RPGBackground()
}
