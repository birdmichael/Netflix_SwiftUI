//
//  RSwiftUI.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/4.
//

import Rswift
import SwiftUI


extension FontResource {
    /// make SwiftUI Font
    func font(size: CGFloat) -> Font {
        Font.custom(fontName, size: size)
    }
}

extension ColorResource {
    /// make SwiftUI Color
    var color: Color {
        Color(name)
    }
}

extension StringResource {
    var localizedStringKey: LocalizedStringKey {
        LocalizedStringKey(key)
    }

    /// make SwiftUI Text
    var text: Text {
        Text(localizedStringKey)
    }
}

extension ImageResource {
    /// make SwiftUI Image
    var image: Image {
        Image(name)
    }
}
