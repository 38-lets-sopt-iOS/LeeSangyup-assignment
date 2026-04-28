//
//  LoginViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let loginHeadLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.text = "로그인/가입하려는\n이메일을 입력해주세요"
        $0.numberOfLines = 2
        $0.font = .head2
    }
    
    private let loginBodyLabel = UILabel().then {
        $0.textColor = .grey200
        $0.textAlignment = .left
        $0.text = "결제 등 중료 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        $0.numberOfLines = 2
        $0.font = .body1
    }
    
    private let emailTextField = SignInTextField().then {
        $0.textFieldPlaceholder = "email@address.com"
    }
    
    private let nextButton = BoxButton("다음", isEnabled: false)
    
    // MARK: - Custom Method
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        emailTextField.text = nil
        nextButton.isEnabled = false
        emailTextField.rightViewMode = .never
    }
    
    override func setUI() {
        view.addSubviews(loginHeadLabel,
                         loginBodyLabel,
                         emailTextField,
                         nextButton)
    }
    
    override func setDelegate() {
        emailTextField.validationDelegate = self
    }
    
    override func setLayout() {
        loginHeadLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(109)
            $0.leading.equalToSuperview().inset(30)
        }
        
        loginBodyLabel.snp.makeConstraints {
            $0.top.equalTo(loginHeadLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(30)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(loginBodyLabel.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(47)
        }
        
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(13)
            $0.height.equalTo(56)
        }
    }
    
    override func addTarget() {
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    
    @objc
    private func nextButtonDidTap() {
        let passwordVC = PasswordViewController()
        passwordVC.dataBind(email: emailTextField.text)
        passwordVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(passwordVC, animated: true)
    }
}

// MARK: - Functions

extension LoginViewController: TextFieldValidatingDelegate {
    func textFieldValidityDidChange() {
        let field = emailTextField
        nextButton.isEnabled = field.isValidated
    }
}
