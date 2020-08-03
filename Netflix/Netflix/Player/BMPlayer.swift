//
//  BMPlayer.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import Foundation
import AVKit

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func setPlayer(_ player: AVPlayer?) {
        playerLayer.player = player
    }
    
}
