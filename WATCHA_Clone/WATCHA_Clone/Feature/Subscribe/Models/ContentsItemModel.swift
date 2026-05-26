//
//  ContentsItemModel.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

struct ContentsItemModel {
    let itemImg: UIImage
}

extension ContentsItemModel {
    static func dummy() -> [ContentsItemModel] {
        return [
            ContentsItemModel(itemImg: .movie1),
            ContentsItemModel(itemImg: .movie2),
            ContentsItemModel(itemImg: .movie3),
            ContentsItemModel(itemImg: .movie4),
            ContentsItemModel(itemImg: .movie5)
        ]
    }
}
