//
//  ArchiveViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/30/26.
//

import UIKit

import SnapKit
import Then

final class ArchiveViewController: BaseUIViewController {
    
    lazy var centerLabel = UILabel().then {
        $0.text = "보관함 탭입니다"
        $0.font = .head1
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    override func setUI() {
        view.backgroundColor = .black
        view.addSubviews(centerLabel)
    }
    
    override func setLayout() {
        centerLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
