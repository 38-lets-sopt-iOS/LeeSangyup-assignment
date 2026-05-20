//
//  SubscribeTitleHeaderView.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/20/26.
//

import UIKit

import SnapKit
import Then

final class SubscribeTitleHeaderView: UICollectionReusableView {
    
    static let identifier = "SubscribeTitleHeaderView"
    
    private let titleLabel = UILabel().then {
        $0.text = "구독"
        $0.font = .head1
        $0.textColor = .white
    }
    
    private let divider = UIView().then {
        $0.backgroundColor = .grey300
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(titleLabel, divider)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.lessThanOrEqualToSuperview().inset(28)
            $0.height.equalTo(36)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
