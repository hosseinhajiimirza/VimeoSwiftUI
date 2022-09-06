//
//  Host.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct Host: View {
    // @AppStorage is the same as UserDefaults
    @AppStorage("isWalkthroughShowed") private var isWalkthroughShowed: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            if isWalkthroughShowed {
                Home()
            } else {
                Walkthrough(isWalkthroughShowed: $isWalkthroughShowed)
            }
        }
    }
}

struct Host_Previews: PreviewProvider {
    static var previews: some View {
        Host()
            .preferredColorScheme(.dark)
    }
}
