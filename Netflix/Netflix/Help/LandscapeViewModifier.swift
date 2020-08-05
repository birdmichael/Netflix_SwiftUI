//
//  LandscapeViewModifier.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/5.
//

import SwiftUI

/**
 lock the View landscape disappear
 ```
 +-----------------------------+
 |  +---+                      |
 |  |   |                      |
 |  |   |         +----------+ |
 |  |   | +-----> |          | |
 |  |   |         +----------+ |
 |  +---+                      |
 +-----------------------------+
 ```
 chane the appledate `orientationLock` to portrait, and set `UIDevice` for `orientation`
 */
struct LandscapeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onDisappear(perform: {
                DispatchQueue.main.async {
                    AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    UINavigationController.attemptRotationToDeviceOrientation()
                }
            })
            .onAppear(perform: {
                AppDelegate.orientationLock = UIInterfaceOrientationMask.landscape
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            })
    }
}

extension View {
    func lockLandscape() -> some View {
        self.modifier(LandscapeViewModifier())
    }
}

extension AppDelegate {
    // 屏幕旋转锁定
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
