//
//  Player.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/4.
//

import SwiftUI
import AVKit

struct Player: View {
    
    @ObservedObject var viewModel: PlayerStore
    @State var play: Bool = true
    @State var time: CMTime = .zero
    @State private var celsius: Double = 0
    
    init() {
        viewModel = PlayerStore()
    }
    
    @Environment(\.presentationMode) var presenting
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VideoPlayer(url: viewModel.url,
                        play: $viewModel.play,
                        time: $viewModel.time)
                .aspectRatio(16/9, contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
         
                ZStack {
                    LinearGradient(gradient: .init(colors: [Color.black.opacity(0.8),
                                                            Color.black.opacity(0.1),
                                                            Color.black.opacity(0.8),]),
                                   startPoint: .top, endPoint: .bottom)
                    VStack {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("第1季第1集：留在室内")
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                presenting.wrappedValue.dismiss()
                            }, label: {
                                R.image.icon_close_24.image.renderingMode(.original)
                            })
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                viewModel.time = CMTimeMakeWithSeconds(max(0, self.time.seconds - 5), preferredTimescale: viewModel.time.timescale)
                            }, label: {
                                Image(systemName: "gobackward.10")
                                    .playControl()
                            })
                            Spacer()
                            Button(action: {
                                viewModel.play.toggle()
                            }, label: {
                                Image(systemName: "pause.fill")
                                    .playControl()
                            })
                            Spacer()
                            Button(action: {
                                viewModel.time = CMTimeMakeWithSeconds(viewModel.time.seconds + 10, preferredTimescale: viewModel.time.timescale)
                            }, label: {
                                Image(systemName: "goforward.10")
                                    .playControl()
                            })
                            Spacer()
                        }
                        Spacer()
                        
                        HStack {
                            ZStack(alignment: .leading) {
                                Slider(value: $celsius, in: 0...100, step: 0.1)
                                    .accentColor(.red)
                                    .foregroundColor(.yellow)
                            }
                            
                            Text("\(celsius)")
                                .foregroundColor(.white)
                        }
                    }
                
                }
            .padding()
            
        }
    
    }
}

fileprivate struct PlayControlButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .fixedSize()
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
    }
}
fileprivate extension Image {
    func playControl() -> some View {
        self.modifier(PlayControlButton())
    }
}

class PlayerStore: ObservableObject {
    @Published var mute: Bool = true
    @Published var play: Bool = true
    @Published var time: CMTime = .zero
    @Published var autoReplay: Bool = true
    @Published var totalDuration: Double = 0
    @Published var url: URL
    
    init() {
        self.url = URL(string: "http://1253131631.vod2.myqcloud.com/26f327f9vodgzp1253131631/f4c0c9e59031868222924048327/f0.mp4")!
    }
    
    struct PlayerItem: Codable {
        var name:String = "视频名称"
    }
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player().previewLayout(.fixed(width: 812, height: 375))
    }
}
