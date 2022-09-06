//
//  ViewExtensions.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI

extension View {
    /// Rotation will be available for both portrait and landscape for the specific view 
    func unlockRotation() -> some View {
        onAppear {
            AppDelegate.orientationLock = UIInterfaceOrientationMask.allButUpsideDown
            UIViewController.attemptRotationToDeviceOrientation()
        }
        .onDisappear {
            AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }
}
