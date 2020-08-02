//
//  HomeModel.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var name: String
    var movies: [Moive]
    var type: CategoryType = .nomal
    
    enum CategoryType:String, Codable {
        /// 普通
        case nomal
        /// 正在播放
        case palying
        /// 精彩预览
        case wonderful
        /// 原创
        case original
    }
}

struct Moive: Identifiable, Codable {
    var id = UUID()
    var name: String
    var des: String
    var imageUrl: String = imageUrls.randomElement()!
    var type: MoiveType
    var progress: Double = 0.5
}

enum MoiveType:String, Codable {
    case movie
}


let imageUrls:[String] = ["https://s1.ax1x.com/2020/08/02/atOfRU.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPe6P.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPum8.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPMTg.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPGpn.jpg"]
