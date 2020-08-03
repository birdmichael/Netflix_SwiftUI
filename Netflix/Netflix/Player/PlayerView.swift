//
//  PlayerView.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewStore
    @Environment(\.presentationMode) var presenting
    @State var palyer: AVURLAsset = AVURLAsset(url: URL(string: "http://1253131631.vod2.myqcloud.com/26f327f9vodgzp1253131631/f4c0c9e59031868222924048327/f0.mp4")!)
    var body: some View {
        ZStack {
            Color.black
            VideoPlayer(palyer: palyer)
            Color.black.opacity(0.5).onTapGesture(count: 1, perform: {
                presenting.wrappedValue.dismiss()
            })
        }
        .ignoresSafeArea()
    }
    
    init() {
        viewModel = PlayerViewStore()
    }
    

}

class PlayerViewStore: ObservableObject {
    @Published var isOn = false
    @Published var player: BMPlayerLayerView?

    deinit {
        player?.resetPlayer()
        print("ViewModel deinit ")
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}


struct VideoPlayer: UIViewRepresentable {
    @State var palyer: AVURLAsset
    
    public func makeUIView(context: Context) -> BMPlayerLayerView {
        let player = BMPlayerLayerView()
        player.playAsset(asset: palyer)
        player.play()
        player.aspectRatio = .sixteen2NINE
        return player
    }
    
    public func makeCoordinator() -> Coordinator {
    }
    
    public func updateUIView(_ uiView: BMPlayerLayerView, context: Context) {
  
    }
    
    func stopPlay()  {
        
    }
    
    
}
