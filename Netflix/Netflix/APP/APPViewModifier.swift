//
//  APPViewModifier.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import SwiftUI

struct TabbarViewBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            content
        }
    }
}

extension View {
    func tabbarViewBackground() -> some View {
        self.modifier(TabbarViewBackgroundModifier())
    }
}
