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
    
    // MARK: - Properties
    
    private let itemList = NewItemModel.dummy()
    private let contentsItemList = ContentsItemModel.dummy()
    private let upcomingItemList = ContentsItemModel.dummy()
    private let partyItemList = PartyItemModel.dummy()
    
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
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: SubscribeCompositionalLayout.createLayout()).then {
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        $0.backgroundColor = .clear
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
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
                               collectionView
        )
    }
    
    override func setLayout() {
        stickyHeaderView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(27)
            $0.height.equalTo(36)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        scrollView.contentLayoutGuide.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(scrollView.contentLayoutGuide).inset(28)
            $0.trailing.lessThanOrEqualTo(scrollView.contentLayoutGuide).inset(28)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(28)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1500)
            $0.bottom.equalTo(scrollView.contentLayoutGuide)
        }
    }
    
    override func setDelegate() {
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(
            NewCollectionViewCell.self,
            forCellWithReuseIdentifier: NewCollectionViewCell.identifier
        )
        collectionView.register(
            WatgorithmCollectionViewCell.self,
            forCellWithReuseIdentifier: WatgorithmCollectionViewCell.identifier
        )
        collectionView.register(
            WatchaPartyCollectionViewCell.self,
            forCellWithReuseIdentifier: WatchaPartyCollectionViewCell.identifier
        )
        collectionView.register(
            SubscribeSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SubscribeSectionHeaderView.identifier
        )
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier
        )
    }
}

// MARK: - Extension

extension SubscribeViewController: UICollectionViewDelegate { }

extension SubscribeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SubscribeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = SubscribeSection(rawValue: section) else { return 0 }
        
        switch section {
        case .newContents:
            return itemList.count
        case .watgorithm:
            return contentsItemList.count
        case .upcoming:
            return upcomingItemList.count
        case .watchaParty:
            return partyItemList.count
        case .main:
            return upcomingItemList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = SubscribeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .newContents:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.identifier, for: indexPath) as? NewCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(itemList[indexPath.row])
            return cell
        case .watgorithm:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatgorithmCollectionViewCell.identifier, for: indexPath) as? WatgorithmCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(contentsItemList[indexPath.row])
            return cell
        case .upcoming:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatgorithmCollectionViewCell.identifier, for: indexPath) as? WatgorithmCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(upcomingItemList[indexPath.row])
            return cell
        case .watchaParty:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchaPartyCollectionViewCell.identifier, for: indexPath) as? WatchaPartyCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(partyItemList[indexPath.row])
            return cell
        case .main:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(upcomingItemList[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SubscribeSectionHeaderView.identifier, for: indexPath) as? SubscribeSectionHeaderView else {
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 1:
            headerView.dataBind(title: "방금 막 도착한 신상 컨텐츠", subtitle: "예능부터 드라마까지!", showsMoreButton: false, showImage: false)
        case 2:
            headerView.dataBind(title: nil, subtitle: "예능부터 드라마까지!", showsMoreButton: true, showImage: true)
        case 3:
            headerView.dataBind(title: "공개 예정 콘텐츠", subtitle: "", showsMoreButton: true, showImage: false)
        case 4:
            headerView.dataBind(title: "왓차 파티", subtitle: "", showsMoreButton: true, showImage: false)
        default:
            break
        }
        
        return headerView
    }
}
