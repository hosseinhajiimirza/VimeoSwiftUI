//
//  CustomActivityIndicator.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct CustomActivityIndicator: View {
    @State private var isAnimated: Bool = false
    // colors
    var colors: [Color] = [Color](repeating: Color.white.opacity(0.5), count: 11)
    
    var body: some View {
        ZStack {
            ForEach(Array(zip(colors.indices, colors)), id: \.0) { index, color in
                Circle()
                    .trim(from: isAnimated ? 0.3 : 0.8, to: isAnimated ? 0.5 : 1)
                    .fill(color.opacity(0.5))
                    .frame(width: isAnimated ? 100 : 100, height: isAnimated ? 100 : 100)
                    .offset(x: isAnimated ? 30 : 0, y: isAnimated ? 30 : 0)
                    .rotationEffect(Angle(degrees: isAnimated ? Double(index * 33) : Double(index * 10)))
            }
        }
        .onAppear {
            withAnimation(
                .linear
                    .repeatForever(autoreverses: true)
                    .speed(0.2)
            ) {
                isAnimated.toggle()
            }
        }
    }
}

struct CustomActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomActivityIndicator()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
