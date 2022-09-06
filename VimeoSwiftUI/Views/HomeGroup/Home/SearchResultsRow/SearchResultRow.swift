//
//  SearchResultRow.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct SearchResultRow: View {
    let dataElementsModel: DataElementsModel
    // to know that we are in light mode or dark mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                SearchResultListRowThumbnail(
                    imageURL:
                        (dataElementsModel.pictures.sizes.count > 3) ? dataElementsModel.pictures.sizes[3].link : "", duration: dataElementsModel.duration)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(dataElementsModel.name)
                    .font(.title3)
                    .lineLimit(1)
                Text(dataElementsModel.description)
                    .font(.callout)
                    .lineLimit(2)
            }
            .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .background(
            colorScheme == .light ? .white.opacity(0.2) : .black.opacity(0.2)
        )
        .cornerRadius(8)
        
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(dataElementsModel: DataElementsModel())
            .previewLayout(.sizeThatFits)
        SearchResultRow(dataElementsModel: DataElementsModel())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
