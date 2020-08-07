//
//  MoreSubViewBuilder.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - Style constant
fileprivate struct StyleConstant {
    struct Row {
        static let iconToTextSpacing: CGFloat = 20
        static let height: CGFloat = 60
        static let font: Font = .system(size: 18)
        static let iconSize: CGSize = CGSize(width: 25, height: 25)
    }
}

struct MoreViewRow: View {
    var image: Image
    var title: String
    var action: (()->()) = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: StyleConstant.Row.iconToTextSpacing) {
                image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(R.color.garyb3.color)
                    .frame(width: StyleConstant.Row.iconSize.width, height: StyleConstant.Row.iconSize.width, alignment: .center)
                    .accessibility(hidden: true)
                Text(title)
                    .foregroundColor(R.color.garyb3.color)
                    .font(StyleConstant.Row.font)
                Spacer()
                R.image.icon_chevron_right_24.image
                    .renderingMode(.template)
                    .foregroundColor(R.color.gary4c.color)
                    .accentColor(R.color.gary4c.color)
            }
            .padding(.horizontal, 16)
            .foregroundColor(R.color.gary_backgroud.color)            
        }
        .frame(height: StyleConstant.Row.height)
        .background(R.color.gary_backgroud.color)
    }
}

struct MoreUserListView: View {
    @Binding var viewModel: MoreStore
    var body: some View {
        HStack(spacing: 20) {
            ForEach(viewModel.userList) { user in
                VStack(spacing: 12) {
                        WebImage(url: URL(string: user.avatarUrl))
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    Text(user.nikeName).foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 10.0)
    }
}

struct MoreSubViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        MoreViewRow(image: R.image.settingsCheckmark.image, title: "我的片库") {
        }
    }
}

struct MoreViewRow_Library: LibraryContentProvider {
    let action: () -> Void = {}
    let image = R.image.settingsBell.image
    let title = ""
    var views: [LibraryItem] {
        return [LibraryItem(MoreViewRow(image: image, title: title, action: action))]
    }
}
