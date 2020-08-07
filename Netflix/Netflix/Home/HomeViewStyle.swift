//
//  HomeViewStyle.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import Foundation
import SwiftUI


extension Text {
    /// Home Category Title Modifier 
    func homeTitleModifier() -> some View {
        self.fontWeight(.semibold)
            .foregroundColor(Color("title_color"))
            .padding(.horizontal, 8)
            .lineLimit(1)
    }

    func playingBottomTextModifier() -> some View {
        self.font(.system(size: 12))
            .foregroundColor(R.color.title_color.color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .lineLimit(2)
    }
}
