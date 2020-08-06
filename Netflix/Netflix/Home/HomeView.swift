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
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 22.0) {
                    RecommendItem(item: store.recommend)
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
            
        }.navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct HomeNomalCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text(category.name)
                    .font(.system(size: 16)).fontWeight(.semibold)
                    .foregroundColor(Color("title_color"))
                    .padding(.horizontal, 8)
                    .lineLimit(1)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { item in
                        if category.type == .wonderful {
                            WonderfulItem(item: item)
                        } else {
                            MoiveItem(item: item)
                        }
                    }
                }.padding(.horizontal, 8)
            })
        }
    }
}

struct HomeOriginalCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text(category.name)
                    .font(.system(size: 20)).fontWeight(.semibold)
                    .foregroundColor(Color("title_color"))
                    .padding(.horizontal, 8)
                    .lineLimit(1)
                Image("icon_chevron_right_24").accentColor(Color("title_color"))
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { item in
                        if category.type == .wonderful {
                            WonderfulItem(item: item)
                        } else {
                            OriginalItem(item: item)
                        }
                    }
                }.padding(.horizontal, 8)
            })
        }
    }
}

struct HomePalyingCategoryView: View {
    @State var category: Category
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text("bm,请继续观赏")
                    .font(.system(size: 16)).fontWeight(.semibold)
                    .foregroundColor(Color("title_color"))
                    .padding(.horizontal, 8)
                    .lineLimit(1)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(category.movies) { item in
                        GeometryReader { geometry in
                            VStack(spacing: 0.0) {
                                ZStack {
                                    Text(item.name).padding()
                                    WebImage(url: URL(string: item.imageUrl))
                                        .resizable()
                                        .scaledToFill()
                                    
                                    Image("PlayIcon").resizable().renderingMode(.template).foregroundColor(.white)
                                        .frame(width: 80, height: 80)
                                    
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height - 40)
                                .clipped()
                                
                                ZStack(alignment:.leading) {
                                    Color.white.frame(width: geometry.size.width, height: 2)
                                    Color.red.frame(width: geometry.size.width * CGFloat(item.progress), height: 2)
                                }
                                
                                HStack {
                                    Text("第5季 第15集")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("title_color"))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .lineLimit(2)
                                    Spacer()
                                    Image("cf_info")
                                        .padding(.trailing, 5.0)

                                }
                                .background(Color("gary_backgroud"))
                                .frame(maxWidth: .infinity, maxHeight: 40)
                            }
                        }.frame(width: 110, height: 150.0 + 40)
                        
                    }
                }.padding(.horizontal, 8)
            })
        }
    }
}

struct MoiveItem: View {
    @State var item: Moive
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Text(item.name).padding()
            WebImage(url: URL(string: item.imageUrl))
                .resizable()
                .scaledToFit()
        }
        .frame(width: 110, height: 157.0)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture(count: 1, perform: {
            isPresented = true
        })
    }
}

struct OriginalItem: View {
    @State var item: Moive
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Text(item.name).padding()
            WebImage(url: URL(string: item.originalImageUrl))
                .resizable()
                .scaledToFill()
        }
        .frame(width: 166, height: 330.0)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture(count: 1, perform: {
            isPresented = true
        })
        
    }
}

struct WonderfulItem: View {
    @State var item: Moive
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text(item.name).padding()
                    GeometryReader { geometry in
                        WebImage(url: URL(string: item.wonderfulItem.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width - 4, height: geometry.size.width - 4)
                            .overlay(
                                VStack {
                                    Spacer()
                                    LinearGradient(gradient: Gradient(colors: [item.wonderfulItem.color.opacity(0), item.wonderfulItem.color.opacity(0.7)]),
                                                   startPoint: .top, endPoint: .bottom
                                    )
                                    .frame(height: geometry.size.height * 0.7)
                                }
                            )
                            .clipShape(Circle())
                            .overlay(Circle().stroke(item.wonderfulItem.color, lineWidth: 2))
                    }.padding(4)
                    
                }
                
                Spacer()
            }
            VStack {
                Spacer()
                WebImage(url: URL(string: item.wonderfulItem.textImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 35.0)
            }
            
        }
        .frame(width: 110, height: 115)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture(count: 1, perform: {
            isPresented = true
        })
        
    }
}

struct RecommendItem: View {
    @State var item: Moive
    @State var isPresented = false

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text(item.name).padding()
                    GeometryReader { geometry in
                        WebImage(url: URL(string: item.wonderfulItem.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geometry.size.width)
                            .overlay(
                                VStack {
                                    Spacer()
                                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black]),
                                                   startPoint: .top, endPoint: .bottom
                                    )
                                    .frame(height: geometry.size.height * 0.5)
                                }
                            )

                    }

                }

                Spacer()
            }
            VStack(alignment:.center) {
                Spacer()
                WebImage(url: URL(string: item.wonderfulItem.textImageUrl))
                    .resizable()
                    .padding(.bottom, 15.0)
                    .scaledToFit()
                    .frame(maxHeight: 80)
                HStack(alignment: .center) {
                    Spacer()
                    VStack(spacing: 0.0) {
                        Image("settings-plus")
                        Text("我的片单")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.frame(maxWidth:60)
                    Spacer()
                    HStack {
                        Image("icon_play_solid")
                        Text("播放")
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
                        Image("icon_info")
                        Text("资讯")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.frame(maxWidth:40)
                    Spacer()

                }
            }
            

        }
        .frame(height: 550)
        .clipped()
        .fullScreenCover(isPresented: $isPresented, content: {
            Player()
        })
        .onTapGesture(count: 1, perform: {
            isPresented = true
        })


    }
}
