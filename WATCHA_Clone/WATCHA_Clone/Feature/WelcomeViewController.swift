//
//  WelcomeViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/23/26.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let watchaImage = UIImageView().then {
        $0.image = UIImage(resource: .watchaLogo)
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "나연님\n가입을 환영합니다!"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .head2
        $0.textColor = .white
    }
    
    private let toMainButton = BoxButton("메인으로", isEnabled: true)
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.addSubviews(watchaImage,
                         welcomeLabel,
                         toMainButton
        )
    }
    
    override func setLayout() {
        watchaImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(42)
            $0.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(watchaImage.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        
        toMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
}
