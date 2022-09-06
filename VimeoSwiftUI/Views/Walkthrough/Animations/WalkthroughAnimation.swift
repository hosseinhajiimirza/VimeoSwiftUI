//
//  WalkthroughAnimation.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct WalkthroughAnimation: View {
    @Binding var isAnimated: Bool
    // colors:
    var blueColorArray: [Color] = [Color](repeating: Color.blue, count: 6)
    var redColorArray: [Color] = [Color](repeating: Color.red, count: 6)
    var colors: [Color] {
        return blueColorArray + redColorArray
    }

    var body: some View {
        ZStack {
            ForEach(Array(zip(colors.indices, colors)), id: \.0) { index, color in
                Circle()
                    .trim(from: isAnimated ? 0.3 : 0.8, to: isAnimated ? 0.4 : 1)
                    .fill(color.opacity(0.4))
                    .frame(width: isAnimated ? 100 : 100, height: isAnimated ? 100 : 100)
                    .offset(x: isAnimated ? 0 : 30, y: isAnimated ? 0 : 30)
                    .rotationEffect(Angle(degrees: isAnimated ? Double(index * 40) : Double(index * 30)))
            }
        }
        .padding(.bottom, 30)
    }
}

struct WalkthroughAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughAnimation(isAnimated: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
