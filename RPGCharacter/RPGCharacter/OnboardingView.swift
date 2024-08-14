//
//  OnboardingView.swift
//  RPGCharacter
//
//  Created by Ian Pacini on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        CustomShape()
            .frame(width: 200, height: 120)
            .foregroundStyle(.orange)
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let size = max(rect.width, rect.height)
        let rect = CGRect(origin: rect.origin, size: CGSize(width: size, height: size))
        // Desenhar uma forma personalizada
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    OnboardingView()
}
