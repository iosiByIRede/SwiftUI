//
//  RPGTextField.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 18/07/24.
//

import SwiftUI

struct RPGTextField: View {
    @State var title: String = ""
    @State var caption: String = ""

    @Binding var text: String
    
    var isMultiline: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            if !title.isEmpty {
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
            }

            if !isMultiline {
                TextField("", text: $text)
                    .textFieldStyle(RPGTextFieldStyle())
            } else {
                TextField("", text: $text, axis: .vertical)
                    .textFieldStyle(RPGMultilineTextFieldStyle())
            }

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
