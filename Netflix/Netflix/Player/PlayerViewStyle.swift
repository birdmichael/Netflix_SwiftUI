//
//  PlayerViewStyle.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/5.
//

import SwiftUI



extension Text {
    struct PlayerTextModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.white)
                .font(.system(size: 13))
        }
    }
    func playerTextStyle() -> some View {
        self.modifier(PlayerTextModifier())
    }
}

