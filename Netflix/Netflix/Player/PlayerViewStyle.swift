//
//  PlayerViewStyle.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/5.
//

import SwiftUI

fileprivate struct PlayerTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 13))
    }
}

extension Text {
    func playerTextStyle() -> some View {
        self.modifier(PlayerTextModifier())
    }
}

extension Player {
    func palyerText(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 13))
    }
}
