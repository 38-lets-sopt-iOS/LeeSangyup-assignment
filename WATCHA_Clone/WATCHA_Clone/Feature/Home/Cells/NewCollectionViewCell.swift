//
//  NewCollectionViewCell.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

import SnapKit
import Then

class NewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewCollectionViewCell"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let itemImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private func setUI() {
        [itemImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
}

extension NewCollectionViewCell {
    func dataBind(_ itemData: NewItemModel) {
        itemImageView.image = itemData.itemImg
    }
}
