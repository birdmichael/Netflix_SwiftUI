//
//  HomeSubViewBuilder.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// MARK: - Style constant
fileprivate struct StyleConstant {
    struct Moive {
        static let itemSize: CGSize = CGSize(width: 110, height: 157)
        static let titleFont: Font = .system(size: 16)
    }
    struct Original {
        static let itemSize: CGSize = CGSize(width: 166, height: 330)
        static let titleFont: Font = .system(size: 16)
    }

    struct Playing {
        static let itemSize: CGSize = CGSize(width: 110, height: 190)
        static let bottomHeight: CGFloat = 40
        static let iconSize: CGSize = CGSize(width: 80, height: 80)
    }

    struct Wonderful {
        static let lineWidth: CGFloat = 2
        static let textImageMaxHeight: CGFloat = 35
        static let itemSize: CGSize = CGSize(width: 110, height: 115)
    }

    struct Recommend {
        static let maxHeight: CGFloat = 500
    }
}

// MARK: - Nomal
struct HomeNomalCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text(category.name)
                    .font(StyleConstant.Moive.titleFont)
                    .homeTitleModifier()
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { item in
                        if category.type == .wonderful {
                            HomeWonderfulItemView(moive: item)
                        } else {
                            HomeMovieItemView(item: item)
                        }
                    }
                }.padding(.horizontal, 8)
            })
        }
    }
}

/// Nomal home moive item
struct HomeMovieItemView: View {
    @State var item: Moive
    @State var isPresented = false

    var body: some View {
        ZStack {
            Text(item.name).padding()
            WebImage(url: URL(string: item.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: StyleConstant.Moive.itemSize.width, height: StyleConstant.Moive.itemSize.height)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture {
            isPresented = true
        }
    }
}

// MARK: - Home Original
struct HomeOriginalCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text(category.name)
                    .font(StyleConstant.Original.titleFont)
                    .homeTitleModifier()
                R.image.icon_chevron_right_24.image
                    .accentColor(R.color.title_color.color)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { item in
                        HomeOriginalItemView(item: item)
                    }
                }
                .padding(.horizontal, 8)
            })
        }
    }
}

struct HomeOriginalItemView: View {
    @State var item: Moive
    @State var isPresented = false

    var body: some View {
        ZStack {
            Text(item.name).padding()
            WebImage(url: URL(string: item.originalImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: StyleConstant.Original.itemSize.width, height: StyleConstant.Original.itemSize.height)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture {
            isPresented = true
        }

    }
}

// MARK: - Palying
struct HomePalyingCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text("bm,请继续观赏")
                    .font(.system(size: 16)).fontWeight(.semibold)
                    .foregroundColor(R.color.title_color.color)
                    .padding(.horizontal, 8)
                    .lineLimit(1)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { moive in
                        HomePlayingItemView(moive: moive)
                    }
                }.padding(.horizontal, 8)
            })
        }
    }
}

struct HomePlayingItemView: View {
    @State var moive: Moive
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0.0) {
                ZStack {
                    Text(moive.name).padding()
                    WebImage(url: URL(string: moive.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                    R.image.playIcon.image.resizable().renderingMode(.template).foregroundColor(.white)
                        .frame(width: StyleConstant.Playing.iconSize.width, height: StyleConstant.Playing.iconSize.height)

                }
                .frame(width: geometry.size.width, height: geometry.size.height - StyleConstant.Playing.bottomHeight)
                

                // progress
                ZStack(alignment:.leading) {
                    Color.white.frame(width: geometry.size.width, height: 2)
                    Color.red.frame(width: geometry.size.width * CGFloat(moive.progress), height: 2)
                }

                HStack {
                    Text("第5季 第15集")
                        .playingBottomTextModifier()
            
                    Spacer()
                    R.image.cf_info.image.padding(.trailing, 5.0)

                }
                .background(R.color.gary_backgroud.color)
                .frame(maxHeight: StyleConstant.Playing.bottomHeight)
            }
        }.frame(width: StyleConstant.Playing.itemSize.width, height: StyleConstant.Playing.itemSize.height)
    }
}

// MARK: - Wonderful

struct HomeWonderfulItemView: View {
    @State var moive: Moive
    @State var isPresented = false

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text(moive.name).padding()
                    WebImage(url: URL(string: moive.wonderfulItem.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [moive.wonderfulItem.color.opacity(0), moive.wonderfulItem.color.opacity(0.7)]),
                                           startPoint: .top, endPoint: .bottom
                            ).padding(.top, 40)
                        )
                        .clipShape(Circle())
                        .overlay(Circle().stroke(moive.wonderfulItem.color, lineWidth: StyleConstant.Wonderful.lineWidth))

                }
                .padding([.top, .leading, .trailing], StyleConstant.Wonderful.lineWidth)

                Spacer()
            }
            VStack {
                Spacer()
                WebImage(url: URL(string: moive.wonderfulItem.textImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: StyleConstant.Wonderful.textImageMaxHeight)
            }

        }
        .frame(width: StyleConstant.Wonderful.itemSize.width, height: StyleConstant.Wonderful.itemSize.height)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture {
            isPresented = true
        }

    }
}

// MARK: - Recommend

struct HomeRecommendView: View {
    @State var moive: Moive
    @State var isPresented = false

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text(moive.name).padding()
                    GeometryReader { geometry in
                        WebImage(url: URL(string: moive.wonderfulItem.imageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(
                                VStack {
                                    Spacer()
                                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black]),
                                                   startPoint: .top, endPoint: .bottom
                                    )
                                    .frame(height: geometry.size.height * 0.5)
                                }
                            )
                            .frame(maxWidth: geometry.size.width)
                    }
                }
                Spacer()
            }
            VStack(alignment:.center) {
                Spacer()
                WebImage(url: URL(string: moive.wonderfulItem.textImageUrl))
                    .resizable()
                    .padding(.bottom, 15.0)
                    .scaledToFit()
                    .frame(maxHeight: 80)
                
                HStack(alignment: .center) {
                    Spacer()
                    VStack(spacing: 0.0) {
                        R.image.settingsPlus.image
                        Text("我的片单")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.frame(maxWidth:60)
                    Spacer()
                    HStack {
                        R.image.icon_play_solid.image
                        Text(R.string.localizable.play())
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                    }
                    .frame(width: 130, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 3).foregroundColor(.white)
                    , alignment: .center)
                    Spacer()
                    VStack(spacing: 0.0) {
                        R.image.iconInfo.image
                        Text("资讯")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.frame(maxWidth:40)
                    Spacer()

                }
            }


        }
        .frame(height: StyleConstant.Recommend.maxHeight)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture {
            isPresented = true
        }


    }
}


struct HomeSubView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMovieItemView(item: .init(name: "1111111111111111111111111111111", des: "1"))
            .previewLayout(.sizeThatFits)
        HomeOriginalItemView(item: .init(name: "1111111111111111111111111111111", des: "1"))
            .previewLayout(.sizeThatFits)
        HomePlayingItemView(moive: .init(name: "1111111111111111111111111111111", des: "1"))
            .previewLayout(.sizeThatFits)
        HomeWonderfulItemView(moive: .init(name: "1111111111111111111111111111111", des: "1"))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Wonderful")
        HomeRecommendView(moive: .init(name: "1111111111111111111111111111111", des: "1"))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("HomeRecommendView")
    }
}

