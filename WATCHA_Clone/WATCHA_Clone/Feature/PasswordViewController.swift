//
//  PasswordViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import UIKit

import SnapKit
import Then

final class PasswordViewController: BaseUIViewController {
    
    // MARK: - Property
    
    private var userEmail: String?
    private var nickname: String?
    
    // MARK: - UI Components
    
    private let passwordHeadLabel = UILabel().then {
        $0.text = "사용할 비밀번호를\n입력해주세요"
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = .head2
        $0.textColor = .white
    }
    
    private let passwordBodyLabel = UILabel().then {
        $0.text = "userEmail로 가입 중"
        $0.textAlignment = .center
        $0.font = .body1
        $0.textColor = .grey200
    }
    
    private let passwordTextField = SignInTextField().then {
        $0.textFieldPlaceholder = "비밀번호 입력"
        $0.type = .password
    }
    
    private let checkImage = UIImageView().then {
        $0.image = UIImage(resource: .enableOff)
        $0.contentMode = .scaleAspectFit
    }
    
    private let passwordRuleLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.font = .body2
        $0.textColor = .grey100
        $0.textAlignment = .center
    }
    
    private let inputStateStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 6
        $0.alignment = .center
    }
    
    private let setNicknameButton = UIButton().then {
        $0.backgroundColor = .clear
        
        let title = "닉네임 설정"
        let attributedTitle = NSAttributedString(string: title, attributes: [
            .font: UIFont.body2,
            .foregroundColor: UIColor.grey100,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.grey100,
            .baselineOffset: 2
        ])
        
        $0.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private let signinButton = BoxButton("가입하기", isEnabled: false)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
    }
    
    // MARK: - Custom Methods

    override func setDelegate() {
        passwordTextField.validationDelegate = self
    }
    
    override func setUI() {
        view.addSubviews(passwordHeadLabel,
                         passwordBodyLabel,
                         passwordTextField,
                         inputStateStackView,
                         setNicknameButton,
                         signinButton
        )
        inputStateStackView.addArrangedSubview(checkImage)
        inputStateStackView.addArrangedSubview(passwordRuleLabel)
    }
    
    override func setLayout() {
        passwordHeadLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(109)
            $0.leading.equalToSuperview().inset(30)
        }
        
        passwordBodyLabel.snp.makeConstraints {
            $0.top.equalTo(passwordHeadLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(30)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordBodyLabel.snp.bottom).offset(44)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(47)
        }
        
        inputStateStackView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(30)
        }
        
        setNicknameButton.snp.makeConstraints {
            $0.top.equalTo(inputStateStackView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        signinButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(13)
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    override func addTarget() {
        setNicknameButton.addTarget(self, action: #selector(setNicknameButtonDidTap), for: .touchUpInside)
        signinButton.addTarget(self, action: #selector(signinButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    
    @objc
    private func setNicknameButtonDidTap() {
        let nicknameVC = SetNicknameViewController()
        nicknameVC.modalPresentationStyle = .pageSheet
        if let sheet = nicknameVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        nicknameVC.onNicknameSelected = { [weak self] nickname in
            self?.bindNickname(nickname: nickname)
        }
        present(nicknameVC, animated: true, completion: nil)
    }
    
    @objc
    private func signinButtonDidTap() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.dataBind(nickname: nickname)
        welcomeVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    // MARK: - PrivateMethod
    
    private func bindData() {
        self.passwordBodyLabel.text = "\(userEmail ?? "???")로 가입 중"
    }
    
    private func bindNickname(nickname: String?) {
        self.nickname = nickname
        let title = nickname ?? "???"
        let attributedTitle = NSAttributedString(string: title, attributes: [
            .font: UIFont.body2,
            .foregroundColor: UIColor.grey100,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.grey100,
            .baselineOffset: 2
        ])
        setNicknameButton.setAttributedTitle(attributedTitle, for: .normal)
        updateSigninButtonState()
    }
    
    private func updateSigninButtonState() {
        let isPasswordValid = passwordTextField.isValidated
        let hasNickname = nickname != nil
        signinButton.isEnabled = isPasswordValid && hasNickname
    }
    
    // MARK: - HelperMethod
    
    public func dataBind(email: String?) {
        self.userEmail = email
    }
}

// MARK: - Functions

extension PasswordViewController: TextFieldValidatingDelegate {
    func textFieldValidityDidChange() {
        let field = passwordTextField
        checkImage.image = field.isValidated
        ? UIImage(resource: .enableOn)
        : UIImage(resource: .enableOff)
        passwordRuleLabel.textColor = field.isValidated ? .green : .grey100
        updateSigninButtonState()
    }
}
