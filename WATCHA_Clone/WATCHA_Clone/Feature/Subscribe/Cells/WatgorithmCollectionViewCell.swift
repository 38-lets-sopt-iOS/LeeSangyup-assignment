//
//  WatgorithmCollectionViewCell.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

import SnapKit
import Then

class WatgorithmCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WatgorithmCell"
    
    // MARK: - UI Components
    
    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setupUI() {
        contentView.addSubview(thumbnailImageView)
    }
    
    private func setupLayout() {
        thumbnailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure(
        image: UIImage?
    ) {
        thumbnailImageView.image = image
    }
}

// MARK: - Function

extension WatgorithmCollectionViewCell {
    func dataBind(_ itemData: ContentsItemModel) {
        thumbnailImageView.image = itemData.itemImg
    }
}
