//
//  SubscribeCompositionalLayout.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/1/26.
//

import UIKit

// MARK: - Section Type

enum SubscribeSection: Int, CaseIterable {
    case main
    case newContents
    case watgorithm
    case upcoming
    case watchaParty
}

// MARK: - CollectionView CompositionalLayout

struct SubscribeCompositionalLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ in
            switch sectionNumber {
            case SubscribeSection.main.rawValue: mainSection
            case SubscribeSection.newContents.rawValue: newContentsSection
            case SubscribeSection.watgorithm.rawValue: watgorithmSection
            case SubscribeSection.upcoming.rawValue: upcomingSection
            case SubscribeSection.watchaParty.rawValue: watchaPartySection
            default: newContentsSection
            }
        }
    }
    
    // MARK: - Set Section Layout
    
    static var mainSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(273), heightDimension: .absolute(399)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(273), heightDimension: .absolute(399)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 34, trailing: 0)
        return section
    }
    
    static var newContentsSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(321), heightDimension: .absolute(180)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(321), heightDimension: .absolute(180)), subitems: [item])
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(48)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 24, bottom: 45, trailing: 0)
        return section
    }
    
    static var watgorithmSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)), subitems: [item])
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55)),elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 14, bottom: 45, trailing: 14)
        return section
    }
    
    static var upcomingSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)), subitems: [item])
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 14, bottom: 45, trailing: 14)
        return section
    }
    
    static var watchaPartySection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(196), heightDimension: .absolute(185)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(196), heightDimension: .absolute(185)), subitems: [item])
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 17, bottom: 0, trailing: 14)
        return section
    }
}
