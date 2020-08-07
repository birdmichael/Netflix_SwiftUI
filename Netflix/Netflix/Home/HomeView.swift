//
//  HomeView.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @ObservedObject var store: HomeStore = HomeStore()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 22.0) {
                HomeRecommendView(moive: store.recommend)
                ForEach(store.category) { cat in
                    if cat.type == .nomal {
                        HomeNomalCategoryView(category: cat)
                    } else if cat.type == .original {
                        HomeOriginalCategoryView(category: cat)
                    } else if cat.type == .wonderful {
                        HomeNomalCategoryView(category: cat)
                    } else {
                        HomePalyingCategoryView(category: cat)
                    }

                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .tabbarViewBackground()

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
