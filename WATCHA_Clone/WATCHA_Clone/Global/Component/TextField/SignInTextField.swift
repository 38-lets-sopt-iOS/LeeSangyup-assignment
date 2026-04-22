//
//  SignInTextField.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import UIKit

final class SignInTextField: UITextField {
    
    enum TextFieldType {
        case id
        case password
        case nickname
        
        var placeholder: String {
            switch self {
            case .id:
                return "email@address.com"
            case .password:
                return "비밀번호 입력"
            case .nickname:
                return "닉네임"
            }
        }
        
        var placehloderColor: UIColor {
            switch self {
            case .id:
                return .grey300
            case .password:
                return .grey200
            case .nickname:
                return .grey200
            }
        }
        
        var isSecureTextEntry: Bool {
            switch self {
            case .id:
                false
            case .password:
                true
            case .nickname:
                false
            }
        }
        
        var rightViewMode: UITextField.ViewMode {
            switch self {
            case .id:
                return .whileEditing
            case .password:
                return .whileEditing
            case .nickname:
                return .whileEditing
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .id:
                return .emailAddress
            case .password:
                return .default
            case .nickname:
                return .default
            }
        }
    }
    
    // MARK: - Init
    
    init(_ textFieldType: TextFieldType) {
        super.init(frame: .zero)
        
        setup(textFieldType: textFieldType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    
    private func setup(textFieldType: TextFieldType) {
        configureDefaultTextField()
        addPadding(left: 15)
        layer.cornerRadius = 10
        layer.borderWidth = 0
        layer.borderColor = UIColor.grey200.cgColor
        font = .body2
        textColor = .white
        backgroundColor = .grey600
        placeholder = textFieldType.placeholder
        setPlaceholderColor(textFieldType.placehloderColor)
        isSecureTextEntry = textFieldType.isSecureTextEntry
        rightViewMode = textFieldType.rightViewMode
        keyboardType = textFieldType.keyboardType
    }
}
