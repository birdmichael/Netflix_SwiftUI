//
//  MoreView.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import SwiftUI

struct MoreView: View {
    @ObservedObject var viewModel: MoreStore
    var body: some View {
        VStack {
            MoreUserListView(viewModel: viewModel)

            ScrollView {
                VStack(spacing: 2.0) {
                    MoreViewRow(image: R.image.settingsCheckmark.image, title: "我的片库") {
                    }

                    MoreViewRow(image: R.image.settingsSettings.image, title: "App设定") {
                    }
                    MoreViewRow(image: R.image.settingsAccountEmpty.image, title: "账户") {
                    }
                    MoreViewRow(image: R.image.settingsHelp.image, title: "说明") {
                    }

                    VStack(spacing: 10.0) {
                        Text("登出")
                            .font(.system(size: 16))
                            .fontWeight(.thin)
                            .foregroundColor(R.color.garyb3.color)
                        Text("版本:123.23.1(231)")
                            .fontWeight(.thin)
                            .kerning(2)
                            .font(.system(size: 16))
                            .foregroundColor(R.color.gary4c.color)
                    }
                    .padding(.top, 40.0)
                }
            }

        }
            .tabbarViewBackground()
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(viewModel: .init())
    }
}
