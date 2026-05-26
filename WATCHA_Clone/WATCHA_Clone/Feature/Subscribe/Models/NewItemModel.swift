//
//  newItemModel.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

struct NewItemModel {
    let itemImg: UIImage
}

extension NewItemModel {
    static func dummy() -> [NewItemModel] {
        return [
            NewItemModel(itemImg: .newthing1),
            NewItemModel(itemImg: .newthing2),
            NewItemModel(itemImg: .newthing1),
            NewItemModel(itemImg: .newthing2),
            NewItemModel(itemImg: .newthing1),
            NewItemModel(itemImg: .newthing2),
            NewItemModel(itemImg: .newthing1)
            
        ]
    }
}
