//
//  PlayerViewSubViewBuilder.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/5.
//

import SwiftUI

enum PalyControlType {
    case play, goBackward, goForward
}

extension Player {

    func palyControlButton(type: PalyControlType) -> some View {
        let image: Image
        let aciton: () -> Void
        switch type {
            case .play:
                image = viewModel.play ? Image(systemName: "pause.fill") : Image(systemName: "play.fill")
                aciton = {
                    viewModel.playOrPause()
                }
            case .goBackward:
                image = Image(systemName: "gobackward")
                aciton = {
                    viewModel.playOrPause()
                }
            case .goForward:
                image = Image(systemName: "goforward")
                aciton = {
                    viewModel.playOrPause()
                }
        }
        return Button(action: aciton, label: {
            image
                .font(.system(size: 30))
                .fixedSize()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
        })
    }

    /// 集数 、字幕 、 下一集
    func bottomAction() -> some View {
        HStack {
            Button(action: {}, label: {
                Image("icon_episodes_outline")
                palyerText("集数")
            }).accentColor(.white)

            Button(action: {}, label: {
                Image("subtitlesAudio")
                palyerText("音讯和字幕")
            }).accentColor(.white)

            Button(action: {}, label: {
                Image("icon_player_nextItem")
                palyerText("下一集")
            }).accentColor(.white)
        }

    }
}
