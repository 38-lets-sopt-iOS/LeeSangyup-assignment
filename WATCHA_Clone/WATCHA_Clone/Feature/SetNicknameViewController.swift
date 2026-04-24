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
    
    // MARK: - Property
    
    var onNicknameSelected: ((String) -> Void)?
    
    // MARK: - UI Components
    
    private let welcomeLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .white
        $0.font = .subhead1
    }
    
    private let nicknameTextField = SignInTextField().then {
        $0.placeholder = "닉네임 입력"
        $0.type = .nickname
    }
    
    private let completeButton = BoxButton("완료", isEnabled: true).then {
        $0.backgroundColor = .grey600
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .grey400
    }
    
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
            $0.horizontalEdges.equalToSuperview().inset(13)
            $0.height.equalTo(56)
        }
    }
    
    override func addTarget() {
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Action Method
    
    @objc
    private func completeButtonDidTap() {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else { return }
        onNicknameSelected?(nickname)
        dismiss(animated: true)
    }
}
