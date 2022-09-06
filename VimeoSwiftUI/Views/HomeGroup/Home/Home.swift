//
//  SearchResult.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel: ViewModel = .init()
    @State private var dataElementsModel: DataElementsModel?
    
    @State private var searchText: String = ""
    @State private var showResult: Bool = false
    @State private var isVideoDetailsPeresented: Bool = false
    // to know that we are in light mode or dark mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .center) {
            AnimatedLinearGradient()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            if viewModel.isLoading {
                CustomActivityIndicator()
            }
            if searchText.isEmpty {
                Text("Type something to see the result.")
                    .font(.body)
                    .foregroundColor(.white)
            }
            VStack {
                CustomSearchBar(
                    viewModel: viewModel,
                    searchText: $searchText,
                    onChangeOfSearchTextWithDelay: {
                        if !searchText.isEmpty {
                            withAnimation {
                                showResult = true
                            }
                        }
                    })
                .padding(.top)
                .padding(.horizontal)
                ScrollView(.vertical, showsIndicators: false) {
                    if showResult {
                        VStack {
                            ForEach(viewModel.dataModel) { dataElementsModel in
                                Button {
                                    self.dataElementsModel = dataElementsModel
                                    isVideoDetailsPeresented = true
                                } label: {
                                    SearchResultRow(dataElementsModel: dataElementsModel)
                                }
                                .tint(colorScheme == .light ? .black : .white)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isVideoDetailsPeresented) {
            if let dataElementsModel = dataElementsModel {
                VideoDetails(dataElementsModel: dataElementsModel)
            }
        }
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
