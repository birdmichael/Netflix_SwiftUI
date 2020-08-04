//
//  NetflixApp.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/2.
//

import SwiftUI

@main
struct NetflixApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var selectIndex = 0
    var body: some Scene {
        WindowGroup {
            Tabbar(selectIndex: $selectIndex)
        }
    }
}
