//
//  VideoDetailsButton.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI

struct VideoDetailsButton: View {
    let sfSymbol: String
    let totalCount: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Button {
                // should open next page, like comments page...
            } label: {
                Image(systemName: sfSymbol)
                    .imageScale(.large)
            }
            .tint(.secondary)
            Text("\(totalCount)")
                .font(.callout)
        }
    }
}

struct VideoDetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsButton(sfSymbol: "trash", totalCount: 10)
    }
}
