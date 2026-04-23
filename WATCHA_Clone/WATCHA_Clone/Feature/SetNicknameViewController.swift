//
//  SetNicknameViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/23/26.
//

import UIKit

import SnapKit
import Then

final class SetNicknameViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let welcomeLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
    }
    
    private let nicknameTextField = SignInTextField().then {
        $0.placeholder = "닉네임 입력"
    }
    
    private let completeButton = BoxButton("완료", isEnabled: false)
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.addSubviews(welcomeLabel,
                         nicknameTextField,
                         completeButton
        )
    }
    
    override func setLayout() {
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(42)
            $0.leading.equalToSuperview().inset(24)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(19)
            $0.horizontalEdges.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
        
    }
}
