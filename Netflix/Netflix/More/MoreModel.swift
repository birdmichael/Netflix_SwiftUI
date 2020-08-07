//
//  MoreModel.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var nikeName: String = "BM" + ["1","2","3"].randomElement()!
    var avatarUrl: String = "https://wx2.sbimg.cn/2020/08/07/og3Ww.jpg"
}
