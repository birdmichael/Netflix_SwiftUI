//
//  HomeModel.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
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

struct Moive: Identifiable {
    var id = UUID()
    var name: String
    var des: String
    var imageUrl: String = imageUrls.randomElement()!
    var types: [MoiveType] = MoiveType.allCases
    var progress: Double = 0.5
    
    var wonderfulItem: WonderfulModel = WonderfulModel()
    var originalImageUrl:String = ["https://tva3.sinaimg.cn/large/6371019agy1ghge9j9rz6j209i0j0tan.jpg",
                                   "https://tva2.sinaimg.cn/large/6371019agy1ghge9jgny1j209i0j0mz5.jpg",
                                   "https://tva1.sinaimg.cn/large/6371019agy1ghge9jm9zfj209i0j040y.jpg",
                                   "https://tva2.sinaimg.cn/large/6371019agy1ghge9k3nskj209i0j0tbc.jpg",
                                   "https://tva4.sinaimg.cn/large/6371019agy1ghge9k923ij209i0j0dhp.jpg"].randomElement()!
    
}

struct WonderfulModel {
    var imageUrl: String =  ["https://tva2.sinaimg.cn/large/6371019agy1ghgdsxxtktj20gn09dwjz.jpg",
                             "https://tva3.sinaimg.cn/large/6371019agy1ghgdsyftmgj20gn09damf.jpg",
                             "https://tva1.sinaimg.cn/large/6371019agy1ghgdsz3g28j20gn09dahz.jpg",
                             "https://tvax1.sinaimg.cn/large/6371019agy1ghgdszuyxej20gn09dwkp.jpg",
                             "https://tvax3.sinaimg.cn/large/6371019agy1ghgdt08jmzj20gn09dwnv.jpg",
                             "https://tvax4.sinaimg.cn/large/6371019agy1ghgdt0fw24j20gn09djzz.jpg"].randomElement()!
    
    var textImageUrl: String = ["https://wx1.sbimg.cn/2020/08/06/oPbc6.png",
                                    "https://wx1.sbimg.cn/2020/08/06/oPNM7.png",
                                    "https://wx1.sbimg.cn/2020/08/06/oP8iV.png",
                                    "https://wx1.sbimg.cn/2020/08/06/oPxLA.png",
                                    "https://wx1.sbimg.cn/2020/08/06/oPn2Y.png",
                                    "https://wx2.sbimg.cn/2020/08/06/oPlWO.png"].randomElement()!
    
    var color: Color =  [Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))].randomElement()!

}

enum MoiveType:String, Codable, CaseIterable {
    case action,fantasy, comedy, science, musical
}


let imageUrls:[String] = ["https://s1.ax1x.com/2020/08/02/atOfRU.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPe6P.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPum8.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPMTg.jpg",
                          "https://s1.ax1x.com/2020/08/03/aNPGpn.jpg"]


