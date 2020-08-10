//
//  ExtrasStore.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/10.
//

import SwiftUI
import AVKit

class ExtrasStore: ObservableObject {
    @Published var movies: [ExtrasModel] = []
    @Published var visibleID: [UUID] = []

    init() {
        repeat {
            movies.append(ExtrasModel())
        } while (movies.count < 20)
    }


    func addVisible(uuid: UUID) {
        visibleID.append(uuid)
    }
    func removeVisible(uuid: UUID) {
        visibleID.removeAll(where: { $0 == uuid })
    }
}

struct ExtrasModel: Identifiable {
    var id: UUID {
        model.id
    }
    @ObservedObject var contorl: PlayerStore
    @State var model: Moive = ExtrasModel.movies.randomElement()!

    init() {
        self.contorl = PlayerStore()
        self.model = ExtrasModel.movies.randomElement()!
        self.contorl.play = false
    }

    static let movies = [Moive(name: "雨伞学院1", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院2", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院3", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院4", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院5", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院6", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院7", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院8", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院9", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院11", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院22", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院33", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院44", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases),
                  Moive(name: "雨伞学院55", des: "眼看就要決定就讀的大學，艾兒得奮力適應她與諾亞的遠距離戀愛，兼顧和好友小禮之間日漸改變的關係，並面對她對新同學產生的感覺。", types: MoiveType.allCases)
    ]
}
