//
//  Walkthrough.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI

struct Walkthrough: View {
    @Binding var isWalkthroughShowed: Bool
    // to know that we are in light mode or dark mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.4),
                    Color.red.opacity(0.4)
                ],
                startPoint: .top,
                endPoint: .bottom)
            .ignoresSafeArea()
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(alignment: .center, spacing: 16) {
                    Spacer()
                    Text("Welcome!")
                        .font(.title)
                    Spacer()
                    WalkthroughAnimation(isAnimated: $isWalkthroughShowed)
                    Spacer()
                    Button {
                        withAnimation(
                            .linear
                                .speed(0.3)
                        ) {
                            isWalkthroughShowed = true
                        }
                    } label: {
                        Text("Tap to Start")
                            .foregroundColor(colorScheme == .light ? .black.opacity(0.8) : .white.opacity(0.8))
                            .font(.title2)
                            .padding(12)
                            .padding(.horizontal,16)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Walkthrough_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrough(isWalkthroughShowed: .constant(false))
    }
}
