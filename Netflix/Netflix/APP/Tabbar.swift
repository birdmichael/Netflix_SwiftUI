//
//  Tabbar.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/4.
//

import SwiftUI

fileprivate enum TabbarType: Int, CaseIterable {
    case home, search, extras, downloads, more
}

struct Tabbar: View {
    @Binding var selectIndex: Int
    var body: some View {
        TabView(selection: $selectIndex) {
            ForEach(TabbarType.allCases, id: \.rawValue) { type in
                navigationView(by: type)
            }
        }.accentColor(.white)
    }
    
    private func navigationView(by type:TabbarType) -> some View {
        HomeView()
        .tabItem {
            switch type {
            case .home:
                R.image.home.image.renderingMode(.template)
                Text("首页")
            case .search:
                R.image.search.image.renderingMode(.template)
                Text("搜寻")
            case .extras:
                R.image.extrasCardsIcon.image.renderingMode(.template)
                Text("即将上线")
            case .downloads:
                R.image.mcflyDownloads.image.renderingMode(.template)
                Text("下载内容")
            case .more:
                R.image.mcflyMore.image.renderingMode(.template)
                Text("更多")
            }
        }.tag(type.rawValue)
        
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(selectIndex: .constant(0))
    }
}
