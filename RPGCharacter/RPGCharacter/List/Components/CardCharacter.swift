//
//  CardCharacter.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct CardCharacter: View {
    @Binding var cardName: String
    @Binding var image: Image
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Text(cardName)
        }
    }
}

#Preview {
    CardCharacter(
        cardName: .constant("Caio"),
        image: .constant(Image(systemName: "heart.fill"))
    )
}
