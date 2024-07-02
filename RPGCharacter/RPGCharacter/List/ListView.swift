//
//  ListView.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 02/07/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            List {
                CardCharacter(cardName: .constant("Caio"), image: .constant(Image(systemName: "heart.fill")))
            }
        }
    }
}

#Preview {
    ListView()
}
