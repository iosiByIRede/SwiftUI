//
//  RPGTextFieldStyles.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 18/07/24.
//

import SwiftUI

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

struct RPGMultilineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .lineLimit(5...10)
            .padding(.horizontal, 8)
            .background(Color.white.opacity(0.15))
            .clipShape(.rect(cornerSize: .init(width: 10, height: 10)))
            .shadow(color: .black.opacity(0.25) ,radius: 10)
    }
}
