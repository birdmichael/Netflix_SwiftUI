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
    @ViewBuilder
    private func navigationView(by type:TabbarType) -> some View {
        switch type {
            case .home:
                HomeView()
                    .tabItem { R.image.home.image.renderingMode(.template)
                    Text("首页")
                }
                .tag(type.rawValue)
            case .search:
                HomeView().tabItem { R.image.search.image.renderingMode(.template)
                    Text("搜寻")
                }
                .tag(type.rawValue)
            case .extras:
                HomeView().tabItem { R.image.extrasCardsIcon.image.renderingMode(.template)
                    Text("即将上线")
                }
                .tag(type.rawValue)
            case .downloads:
                HomeView().tabItem { R.image.mcflyDownloads.image.renderingMode(.template)
                    Text("下载内容")
                }
                .tag(type.rawValue)
            case .more:
                MoreView()
                    .tabItem { R.image.mcflyMore.image.renderingMode(.template)
                    Text("更多")
                }
                .tag(type.rawValue)
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(selectIndex: .constant(0))
    }
}
