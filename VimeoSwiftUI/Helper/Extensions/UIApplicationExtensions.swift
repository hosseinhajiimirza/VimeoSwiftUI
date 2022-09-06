//
//  UIApplicationExtensions.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI

extension UIApplication {
    /// To dismiss the keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
