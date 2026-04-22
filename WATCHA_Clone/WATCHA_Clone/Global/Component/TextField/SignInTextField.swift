//
//  SignInTextField.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import UIKit

import SnapKit
import Then

protocol TextFieldValidatingDelegate: AnyObject {
    func textFieldValidityDidChange()
}

final class SignInTextField: UITextField {
    
    // MARK: - Type
    
    enum TextFieldType {
        case email
        case password
        case nickname
    }
    
    // MARK: - Public Interface
    
    public var type: TextFieldType = .email {
        didSet { configureFieldType() }
    }
    
    public var textFieldPlaceholder: String? {
        didSet {
            super.placeholder = textFieldPlaceholder
            attributedPlaceholder = NSAttributedString(
                string: textFieldPlaceholder ?? "",
                attributes: [.foregroundColor: UIColor.grey300]
            )
        }
    }
    
    public var isValidated: Bool = false {
        didSet {
            validateCheckImage.image = isValidated
                ? UIImage(resource: .checkOn)
                : UIImage(resource: .checkOff)
        }
    }
    
    weak var validationDelegate: TextFieldValidatingDelegate?
    
    // MARK: - Private Properties
    
    private let focusedBorderColor = UIColor.grey200.cgColor
    private let defaultBorderColor = UIColor.clear.cgColor
    private var isSecure: Bool = true
    
    // MARK: - UI Components
    
    private let clearButton = UIButton().then {
        $0.setImage(.close, for: .normal)
    }
    
    private let validateCheckImage = UIImageView().then {
        $0.image = UIImage(resource: .checkOff)
        $0.contentMode = .scaleAspectFit
    }
    
    private let toggleButton = UIButton().then {
        $0.setImage(.eyeOn, for: .normal)
    }
    
    private let rightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.alignment = .center
    }
    
    private lazy var rightContainerView: UIView = {
        let view = UIView()
        view.addSubview(rightStackView)
        rightStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        return view
    }()
    
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
        configureUI()
        configureActions()
        configureLayout()
        configureFieldType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Config
    
    private func configureUI() {
        font = .body2
        textColor = .white
        backgroundColor = .grey600
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        addLeftPadding(width: 15)
        autocapitalizationType = .none
        clearButtonMode = .never
        rightView = rightContainerView
    }
    
    private func configureLayout() {
        clearButton.snp.makeConstraints { $0.size.equalTo(24) }
        toggleButton.snp.makeConstraints { $0.size.equalTo(24) }
    }
    
    private func configureFieldType() {
        rightStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        switch type {
        case .email:
            isSecureTextEntry = false
            rightStackView.addArrangedSubview(clearButton)
            rightStackView.addArrangedSubview(validateCheckImage)
            
        case .password:
            isSecureTextEntry = isSecure
            rightStackView.addArrangedSubview(clearButton)
            rightStackView.addArrangedSubview(toggleButton)
        case .nickname:
            isSecureTextEntry = false
        }
        
        updateRightViewVisibility()
    }
    
    // MARK: - Actions
    
    private func configureActions() {
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc private func clearText() {
        text = ""
        sendActions(for: .editingChanged)
    }
    
    @objc private func togglePasswordVisibility() {
        isSecure.toggle()
        isSecureTextEntry = isSecure
    }
    
    @objc private func editingDidBegin() {
        layer.borderColor = focusedBorderColor
        updateRightViewVisibility()
    }
    
    @objc private func editingDidEnd() {
        layer.borderColor = defaultBorderColor
        updateRightViewVisibility()
    }
    
    @objc private func textDidChange() {
        updateRightViewVisibility()
        validateEmail()
        validationDelegate?.textFieldValidityDidChange()
    }
    
    private func updateRightViewVisibility() {
        rightViewMode = (text?.isEmpty == false) ? .always : .never
    }
    
    private func validateEmail() {
        let isValid = text?.isValidEmail ?? false
        isValidated = isValid
    }
}
