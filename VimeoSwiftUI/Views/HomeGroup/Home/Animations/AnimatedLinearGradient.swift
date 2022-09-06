//
//  AnimatedLinearGradient.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct AnimatedLinearGradient: View {
    @State private var isAnimatedGradient = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.6), .red.opacity(0.6)]), startPoint: isAnimatedGradient ? .topTrailing : .bottomLeading, endPoint: isAnimatedGradient ? .bottom : .bottomLeading)
            .onAppear {
                withAnimation(
                    .linear(duration: 3)
                    .repeatForever(autoreverses: true)
                ) {
                    isAnimatedGradient.toggle()
                }
            }
    }
}

struct AnimatedLinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLinearGradient()
    }
}
