//
//  CustomSearchBar.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct CustomSearchBar: View {
    enum Field: Hashable {
        case search
        case none
    }
    
    @ObservedObject var viewModel: ViewModel
    // to change the focus when the cancel button tapped
    @FocusState private var focusedField: Field?
    
    @Binding var searchText: String
    @State private var isDelayed: Bool = false
    @State private var showCancelButton: Bool = false
    // actions
    var onChangeOfSearchTextWithDelay: (() -> Void)?
    var cancelButtonTapped: (() -> Void)?
    // to know that we are in light mode or dark mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Type something...", text: $searchText)
                    .font(.body)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .search)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.1)) {
                            showCancelButton = true
                        }
                    }
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                        viewModel.restoreData()
                    } label: {
                        Image(systemName: "multiply")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            
            if showCancelButton {
                Button {
                    // clear searchText and data
                    searchText = ""
                    viewModel.restoreData()
                    // change the focus
                    focusedField = CustomSearchBar.Field.none
                    // hiding the keyboard
                    UIApplication.shared.endEditing()
                    withAnimation {
                        showCancelButton = false
                    }
                } label: {
                    Text("Cancel")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                }
            }
        }
        .onChange(of: searchText) { newValue in
            isDelayed = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isDelayed = true
            }
        }
        .onChange(of: isDelayed) { newValue in
            if newValue {
                onChangeOfSearchTextWithDelay?()
                if !searchText.isEmpty {
                    Task {
                        await viewModel.fetchData(searchText: searchText)
                    }
                }
            }
        }
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(viewModel: ViewModel(), searchText: .constant(""))
            .previewLayout(.sizeThatFits)
        Home()
    }
}
