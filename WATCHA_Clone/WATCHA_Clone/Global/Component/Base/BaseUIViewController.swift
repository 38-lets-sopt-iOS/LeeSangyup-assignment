//
//  BaseUIViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/19/26.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Component
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        addTarget()
        setDelegate()
        
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {}
    
    private func setLayout() {}
    
    // MARK: - Action Method
    
    private func addTarget() {}
    
    // MARK: - Delegate Method
    
    private func setDelegate() {}
}
