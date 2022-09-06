//
//  VimeoSwiftUIApp.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

@main
struct VimeoSwiftUIApp: App {
    // And now in your App scene, use the UIApplicationDelegateAdaptor property wrapper to tell SwiftUI it should use your AppDelegate class for the application delegate. "HackingWifthSwift.com"
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Host()
        }
    }
}
