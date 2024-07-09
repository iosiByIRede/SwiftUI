//
//  RPGImageStyle.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 08/07/24.
//

import SwiftUI

extension Image {
    
    /// Sets the default RPG image style by resizing and styling an image.
    /// - Parameter color: The color to set as the foreground style for the system image.
    /// - Returns: A view configured with the default RPG image style, including resizing, padding, foreground color, and fixed dimensions.
    func rpgImageStyleDefault(color: Color) -> some View {
        self
            .resizable()
            .scaledToFit()
            .padding(10)
            .foregroundStyle(color)
            .frame(width: 65, height: 65)
    }

    /// Sets the RPG image style by resizing and styling an image.
    /// - Returns: A view configured with the RPG image style, including resizing, clipping to a rounded rectangle, and fixed dimensions.
    func rpgImageStyle() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
