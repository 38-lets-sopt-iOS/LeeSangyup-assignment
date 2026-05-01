//
//  SubscribeSectionHeaderView.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

import SnapKit
import Then

final class SubscribeSectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SubscribeSectionHeaderView"
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.font = .head3
        $0.textColor = .white
    }
    
    private let subtitleLabel = UILabel().then {
        $0.font = .subhead1
        $0.textColor = .grey100
    }
    
    private let watImage = UIImageView().then {
        $0.image = UIImage(resource: .watgorithm)
        $0.isHidden = true
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.grey200, for: .normal)
        $0.titleLabel?.font = .cap1
        $0.isHidden = true
    }
    
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
        backgroundColor = .clear
        
        addSubviews(titleLabel,
                    watImage,
                    subtitleLabel,
                    moreButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.top.equalTo(watImage.snp.bottom).offset(8.5)
            $0.leading.trailing.equalToSuperview()
        }
        
        watImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
}

// MARK: - Function

extension SubscribeSectionHeaderView {
    func dataBind(title: String?, subtitle: String, showsMoreButton: Bool, showImage: Bool) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        subtitleLabel.isHidden = subtitle.isEmpty
        watImage.isHidden = !showImage
        moreButton.isHidden = !showsMoreButton
    }
}
