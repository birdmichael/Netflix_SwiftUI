//
//  AppDelegate.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import UIKit

class AppDelegate: NSObject {
    // 屏幕旋转锁定
    static var orientationLock = UIInterfaceOrientationMask.portrait
    override init() {
        super.init()
    }
    
}

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.registerForRemoteNotifications()
        setupAppearance()
        
        return true
    }
}

extension AppDelegate {
    private func setupAppearance() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.4862745098, green: 0.4862745098, blue: 0.4862745098, alpha: 1)
    }
}
