//
//  SubscribeViewController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/30/26.
//

import UIKit

import SnapKit
import Then

final class SubscribeViewController: BaseUIViewController {
    
    private var itemList = NewItemModel.dummy()
    
    // MARK: - UI Components
    
    private let headerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .center
    }
    
    private let videoButton = UIButton().then {
        $0.setImage(.video, for: .normal)
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(.notification, for: .normal)
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(.profile, for: .normal)
    }
    
    private let stickyHeaderView = UILabel().then {
        $0.isHidden = true
        $0.text = "구독"
        $0.font = .head2
        $0.textColor = .white
    }
    
    private let scrollView = UIScrollView()
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "구독"
        $0.font = .head1
        $0.textColor = .white
    }
    
    private let divider = UIView().then {
        $0.backgroundColor = .grey300
    }
    
    private let newLabel = UILabel().then {
        $0.text = "방금 막 도착한 신상 컨텐츠"
        $0.font = .head3
        $0.textColor = .white
    }
    
    private let newSubLabel = UILabel().then {
        $0.text = "예능부터 드라마까지!"
        $0.font = .subhead1
        $0.textColor = .grey100
    }
    
    private let newCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setCollectionViewLayout()
        register()
        setDelegate()
        setLayout()
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.backgroundColor = .black
        
        headerStackView.addArrangedSubview(videoButton)
        headerStackView.addArrangedSubview(notificationButton)
        headerStackView.addArrangedSubview(profileButton)
        
        view.addSubviews(stickyHeaderView,
                         headerStackView,
                         scrollView
        )
        
        scrollView.addSubviews(titleLabel,
                               divider,
                               newLabel,
                               newSubLabel,
                               newCollectionView
        )
    }
    
    override func setLayout() {
        stickyHeaderView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(27)
            $0.height.equalTo(36)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(15)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        scrollView.contentLayoutGuide.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide)
            $0.leading.equalTo(scrollView.contentLayoutGuide).inset(28)
            $0.trailing.lessThanOrEqualTo(scrollView.contentLayoutGuide).inset(28)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(25)
            $0.leading.equalTo(scrollView.contentLayoutGuide).inset(24)
            $0.trailing.lessThanOrEqualTo(scrollView.contentLayoutGuide).inset(24)
        }
        
        newSubLabel.snp.makeConstraints {
            $0.top.equalTo(newLabel.snp.bottom).offset(3)
            $0.leading.equalTo(newLabel)
            $0.trailing.lessThanOrEqualTo(scrollView.contentLayoutGuide).inset(24)
        }
        
        newCollectionView.snp.makeConstraints {
            $0.top.equalTo(newSubLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(180)
            $0.bottom.equalTo(scrollView.contentLayoutGuide).inset(100)
        }
    }
    
    override func setDelegate() {
        scrollView.delegate = self
        newCollectionView.delegate = self
        newCollectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 321, height: 180)
        flowLayout.minimumLineSpacing = 12
        flowLayout.scrollDirection = .horizontal
        self.newCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func register() {
        newCollectionView.register(NewCollectionViewCell.self, forCellWithReuseIdentifier: NewCollectionViewCell.identifier)
    }
}

// MARK: - Extension

extension SubscribeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let titleFrameInRootView = titleLabel.convert(titleLabel.bounds, to: view)
        let stickyFrameInRootView = stickyHeaderView.convert(stickyHeaderView.bounds, to: view)
        let shouldShowStickyHeader = titleFrameInRootView.minY <= stickyFrameInRootView.minY
        
        stickyHeaderView.isHidden = !shouldShowStickyHeader
    }
}

extension SubscribeViewController: UICollectionViewDelegate { }

extension SubscribeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.identifier, for: indexPath) as? NewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}
