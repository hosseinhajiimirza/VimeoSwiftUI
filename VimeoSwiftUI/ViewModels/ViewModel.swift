//
//  ViewModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published public var dataModel: DataModel = .init()
    @Published public var isLoading: Bool = false
    
    private let networkManager: NetworkManager = .init()
    
    public func fetchData(searchText: String) async {
        // Please use your own path, because it's limited
        let urlStr = "https://v1.nocodeapi.com/hosseinhajimi/vimeo/CVdeMELDdICUERgs/search"
        guard var urlComponents = URLComponents(string: urlStr) else { return }
        urlComponents.queryItems = [URLQueryItem(name: "q", value: searchText)]
        // Custom activity indicator apears until we get the data
        self.isLoading = true
        // handling the result:
        networkManager.handleRequestWithURL(urlComponents.url!, completion: { [weak self] (result: Result<MainModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.dataModel = success.data
                    withAnimation {
                        self.isLoading = false
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        })
    }
    
    public func restoreData() {
        self.dataModel.removeAll()
    }
}
