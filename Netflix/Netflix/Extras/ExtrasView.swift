//
//  ExtrasView.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/10.
//

import SwiftUI
import SDWebImageSwiftUI
import Combine


struct ExtrasView: View {
    @ObservedObject var store: ExtrasStore = ExtrasStore()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(store.movies) { movie in
                    
                    LazyVStack {
                        ExtrasPlayerView(movie: movie, store: store)
                            .onDisappear(perform: {
                                store.removeVisible(uuid: movie.id)
                            })
                        
                        HStack {
                            WebImage(url: URL(string: movie.wonderfulItem.textImageUrl))
                                .resizable()
                                .padding(.bottom, 15.0)
                                .scaledToFit()
                                .frame(maxHeight: 60)
                            
                            Spacer()
                            HStack {
                                VStack {
                                    R.image.icon_notifications_outline.image
                                    Text("提醒我")
                                }
                                Spacer()
                                VStack {
                                    R.image.iconInfo.image
                                    Text("资讯")
                                }
                            }.frame(width: 100)
                            
                        }.padding(.horizontal, 22.0).foregroundColor(Color.white)
                        .onAppear(perform: {
                            // when the info onAppear, Mean that the player is fully displayed
                            store.addVisible(uuid: movie.id)
                        })
                        .onDisappear(perform: {
                            store.removeVisible(uuid: movie.id)
                        })
                        
                        
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("迷你影集即将在星期五上线")
                                .foregroundColor(R.color.garyb3.color)
                                .font(.system(size: 15))
                                .fontWeight(.thin)
                                .padding(.bottom, 20.0)
                            Text(movie.name)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                                .padding(.bottom, 10.0)
                            
                            Text(movie.des)
                                .foregroundColor(R.color.garyb3.color)
                                .font(.system(size: 15))
                                .fontWeight(.thin)
                        }
                        .padding(.horizontal, 11.0)
                        
                        
                    }
                    .overlay(
                        Color.black.opacity(store.visibleID.first == movie.id ? 0 : 0.7)
                    )
                }
                
            }
        }
        .tabbarViewBackground()
        
    }
}

struct ExtrasView_Previews: PreviewProvider {
    static var previews: some View {
        ExtrasView()
    }
}


struct ExtrasPlayerView: View {
    var movie: Moive
    @ObservedObject var store: ExtrasStore
    @State var isPlay = true
    init(movie: Moive, store: ExtrasStore) {
        self.movie = movie
        self.store = store
        isPlay = store.visibleID.first == movie.id
    }
    var body: some View {
        ZStack {
            if store.visibleID.first == movie.id {
                VideoPlayer(url: URL(string: movie.playUrl)!, play:$isPlay)
                    .aspectRatio(16/9, contentMode: .fit)
            }
            WebImage(url: URL(string: movie.wonderfulItem.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(store.visibleID.first == movie.id ? 0 : 1)
                .animation(Animation.easeIn(duration: 1.0))
        }
        .onAppear(perform: {
            store.addVisible(uuid: movie.id)
        })
        .onDisappear(perform: {
            store.removeVisible(uuid: movie.id)
        })
        .padding(.top, 20)
    }
}
