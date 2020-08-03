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
            TabView(selection: $selectIndex) {
                NavigationView(content: {
                    HomeView()
                        .navigationBarTitle(Text("Home"), displayMode: .inline)
                        .navigationBarHidden(true)
                    
                })
                .tabItem {
                    HStack {
                        Image("home").renderingMode(.template)
                        Text("首页")
                    }
                    
                }.tag(1)
                NavigationView(content: {
                    HomeView()
                        .navigationBarTitle(Text("Home"), displayMode: .inline)
                        .navigationBarHidden(true)
                    
                }).tabItem {
                    HStack {
                        Image("search").renderingMode(.template)
                        Text("搜寻")
                    }
                }.tag(2)
                
                NavigationView(content: {
                    HomeView()
                        .navigationBarTitle(Text("Home"), displayMode: .inline)
                        .navigationBarHidden(true)
                    
                }).tabItem {
                    HStack {
                        Image("extras-cards-icon").renderingMode(.template)
                        Text("即将上线")
                    }
                }.tag(3)
                NavigationView(content: {
                    HomeView()
                        .navigationBarTitle(Text("Home"), displayMode: .inline)
                        .navigationBarHidden(true)
                    
                }).tabItem {
                    HStack {
                        Image("mcfly-downloads").renderingMode(.template)
                        Text("下载内容")
                    }
                }.tag(4)
                
                NavigationView(content: {
                    HomeView()
                        .navigationBarTitle(Text("Home"), displayMode: .inline)
                        .navigationBarHidden(true)
                    
                }).tabItem {
                    HStack {
                        Image("mcfly-more").renderingMode(.template)
                        Text("更多")
                    }
                    
                }.tag(5)
            }
            .accentColor(.white)
        }
    }

    
}
