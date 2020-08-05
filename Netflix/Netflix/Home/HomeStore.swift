//
//  HomeStore.swift
//  Netflix
//
//  Created by birdmichael on 2020/8/3.
//

import Foundation

class HomeStore: ObservableObject {
    @Published var category: [Category] = []
    
    init() {
        let moives = [Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie),
                      Moive(name: "雨伞学院", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", type: MoiveType.movie)]
        
        category = [Category(name: "精彩预览", movies: moives, type: Category.CategoryType.wonderful),
                    Category(name: "热门选择", movies: moives),
                    Category(name: "动作惊悚片", movies: moives, type: Category.CategoryType.palying),
                    Category(name: "动作惊悚片", movies: moives),
                    Category(name: "Netflix原创作品", movies: moives, type: Category.CategoryType.original),
                    Category(name: "乡村爱情片", movies: moives),
        ]
    }
}
