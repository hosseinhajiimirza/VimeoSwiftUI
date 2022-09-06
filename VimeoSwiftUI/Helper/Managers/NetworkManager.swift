//
//  NetworkManager.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/11/22.
//

import UIKit

protocol NetworkManagerDelegate {
    func handleRequestWithURL<T: Codable>(_ url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkManagerDelegate {
    public func handleRequestWithURL<T: Codable>(_ url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        print("Send to url: \(url)")
        // creating a task:
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                
                return
            }
            // data optional binding and handling:
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    // handling data:
                    completion(.success(model))
                    // to see the respone:
                    print(model)
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }
    
        task.resume()
    }
}

class NetworkManager: NetworkManagerDelegate { }
