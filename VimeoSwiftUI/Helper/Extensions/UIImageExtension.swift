//
//  UIImageViewExtension.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/11/22.
//

import UIKit

extension String {
    public func loadImage() -> UIImage {
        let emptyUIImage = UIImage(systemName: "photo")!
        // handling with do catch statement
        do {
            guard let url = URL(string: self) else { return emptyUIImage }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? emptyUIImage
        }
        
        catch {
            print("error")
        }
        
        return emptyUIImage
    }
}
