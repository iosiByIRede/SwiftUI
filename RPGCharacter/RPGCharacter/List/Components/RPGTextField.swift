//
//  RPGTextField.swift
//  RPGCharacter
//
//  Created by Gilberto Magno on 05/07/24.
//

import Foundation
import SwiftUI

struct RPGTextField: View {
    @State var title: String = ""
    @State var caption: String = ""

    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            if !title.isEmpty {
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
            }

            TextField("", text: $text)
                .textFieldStyle(RPGTextFieldStyle())

            if !caption.isEmpty {
                Text(caption)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.leading, 8)
            }
        }
        .foregroundStyle(Color.white)
    }
}


struct RPGTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 42)
            .padding(.horizontal, 8)
            .background(Color.white.opacity(0.15))
            .clipShape(.rect(cornerSize: .init(width: 10, height: 10)))
            .shadow(color: .black.opacity(0.25) ,radius: 10)
    }
}
