//
//  RPGPicker.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 18/07/24.
//

import SwiftUI

struct RPGPicker: View {
    let title: String
    
    @Binding var selection: String
    
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            if !title.isEmpty {
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            Picker(selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            } label: {
                Text(selection)
            }
            .tint(.white)
            .frame(height: 42)
            .padding(.horizontal, 8)
            .background(Color.white.opacity(0.15))
            .clipShape(.rect(cornerSize: .init(width: 10, height: 10)))
            .shadow(color: .black.opacity(0.25) ,radius: 10)

        }
        .foregroundStyle(Color.white)
        
    }
}
