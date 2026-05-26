//
//  PartyItemModel.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

struct PartyItemModel {
    let itemImg: UIImage
    let startTimeText: String
    let titleText: String
}

extension PartyItemModel {
    static func dummy() -> [PartyItemModel] {
        return [
            PartyItemModel(itemImg: .party1, startTimeText: "오늘 21:30에 시작", titleText: "# 왕과사는 남자"),
            PartyItemModel(itemImg: .party2, startTimeText: "오늘 22:22에 시작", titleText: "# 파묘"),
            PartyItemModel(itemImg: .party1, startTimeText: "오늘 23:00에 시작", titleText: "# 한산"),
            PartyItemModel(itemImg: .party2, startTimeText: "오늘 22:22에 시작", titleText: "# 파묘"),
            PartyItemModel(itemImg: .party2, startTimeText: "오늘 22:22에 시작", titleText: "# 파묘"),
            PartyItemModel(itemImg: .party2, startTimeText: "오늘 22:22에 시작", titleText: "# 파묘")
        ]
    }
}
