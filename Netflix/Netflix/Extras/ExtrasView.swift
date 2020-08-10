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
            LazyVStack(alignment: .leading) {
                ForEach(store.movies) { movie in

                    VStack {
                        Group {
                            if store.visibleID.first == movie.id {
                                VideoPlayer(url: movie.contorl.url, play: movie.$contorl.play)
                                    .aspectRatio(16/9, contentMode: .fit)
                                    .onDisappear(perform: {
                                        store.removeVisible(uuid: movie.id)
                                    })
                            } else {
                                Color.black
                                    .aspectRatio(16/9, contentMode: .fit)
                                    .overlay(
                                        WebImage(url: URL(string: movie.model.wonderfulItem.imageUrl))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    )
                                    .clipped()
                            }
                        }
                        .padding(.top, 20)


                        HStack {
                            WebImage(url: URL(string: movie.model.wonderfulItem.textImageUrl))
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


                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("迷你影集即将在星期五上线")
                                .foregroundColor(R.color.garyb3.color)
                                .font(.system(size: 15))
                                .fontWeight(.thin)
                                .padding(.bottom, 20.0)
                            Text(movie.model.name)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                                .padding(.bottom, 10.0)

                            Text(movie.model.des)
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
