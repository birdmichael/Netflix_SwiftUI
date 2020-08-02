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
                    ForEach(store.category) { cat in
                        if cat.type == .nomal {
                            HomeNomalCategoryView(category: cat)
                        } else {
                            HomePalyingCategoryView(category: cat)
                        }
                        
                    }
                }
            }
            
        }
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
                        ZStack {
                            Text(item.name).padding()
                            WebImage(url: URL(string: item.imageUrl))
                                .resizable()
                                .scaledToFill()
                            
                        }
                        .frame(width: 110, height: 157.0)
                        .clipped()
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
                                    
                                    Image("PlayIcon").renderingMode(.original).foregroundColor(.white)
                                    
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
