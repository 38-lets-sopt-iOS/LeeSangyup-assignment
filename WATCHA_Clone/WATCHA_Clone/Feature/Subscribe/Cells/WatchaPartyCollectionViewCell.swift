//
//  WatchaPartyCollectionViewCell.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

import SnapKit
import Then

final class WatchaPartyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WatchaPartyCollectionViewCell"
    
    // MARK: - UI Components
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let informationContainerView = UIView().then {
        $0.backgroundColor = .grey600
    }
    
    private let startTimeLabel = UILabel().then {
        $0.font = .body1
        $0.textColor = .pink
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .subhead3
        $0.textColor = .white
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(resource: .notificationCircle), for: .normal)
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        contentView.addSubviews(
            posterImageView,
            notificationButton,
            informationContainerView
        )
        
        informationContainerView.addSubviews(
            startTimeLabel,
            titleLabel
        )
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(139)
            $0.width.equalTo(196)
        }
        
        notificationButton.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.top).offset(7)
            $0.trailing.equalTo(posterImageView.snp.trailing).offset(-5)
        }
        
        informationContainerView.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        startTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(startTimeLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(8)
        }
    }
}

// MARK: - Function

extension WatchaPartyCollectionViewCell {
    func dataBind(_ itemData: PartyItemModel) {
        posterImageView.image = itemData.itemImg
        startTimeLabel.text = itemData.startTimeText
        titleLabel.text = itemData.titleText
    }
}
