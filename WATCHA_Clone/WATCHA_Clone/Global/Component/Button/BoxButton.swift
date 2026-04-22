//
//  BoxButton.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/19/26.
//

import UIKit

final class BoxButton: UIButton {
    
    // MARK: - Properties
    
    override var isEnabled: Bool {
        didSet {
            updateButtonState()
        }
    }
    
    // MARK: - Init
    
    public init(_ title: String, isEnabled: Bool = true) {
        super.init(frame: .zero)
        setup(title: title, isEnabled: isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    
    private func setup(title: String, isEnabled: Bool) {
        self.isEnabled = true
        titleLabel?.font = .medium
        layer.cornerRadius = 10
        setTitle(title, for: .normal)
    }
    
    // MARK: - Func
    
    private func updateButtonState() {
        backgroundColor = isEnabled ? .pink : .grey400
        setTitleColor(isEnabled ? .white : .grey200, for: .normal)
    }
}
