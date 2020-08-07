//
//  MoreViewStore.swift
//  Netflix
//
//  Created by BirdMichael on 2020/8/7.
//

import Foundation

class MoreStore: ObservableObject {
    @Published var userList: [User] = []
    @Published var selectUserID: UUID?

    init(userList: [User], selectUserID: UUID?) {
        if let select = selectUserID, userList.contains(where: {select == $0.id}) {
            self.selectUserID = select
        } else  {
            self.selectUserID = userList.first?.id
        }
    }
    init() {
        self.userList = [User(), User(), User(), User()]
        self.selectUserID = userList.randomElement()!.id
    }
}
