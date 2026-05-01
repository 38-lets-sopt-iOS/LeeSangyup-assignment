//
//  TabBarController.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/30/26.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setTabbar()
        setAttribute()
    }
    
    private func setTabbar() {
        let appearanceTabbar = UITabBarAppearance()
        appearanceTabbar.configureWithOpaqueBackground()
        appearanceTabbar.backgroundColor = UIColor.black
        appearanceTabbar.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4.75)
        
        tabBar.standardAppearance = appearanceTabbar
        tabBar.scrollEdgeAppearance = appearanceTabbar
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
    }
    
    private func setAttribute() {
        viewControllers = [
            createTabBarController(for: SubscribeViewController(), title: NSLocalizedString("구독", comment: ""), image: UIImage(resource: .subscribe), selectedImage: UIImage(resource: .subscribe)),
            createTabBarController(for: ListViewController(), title: NSLocalizedString("개별 구매", comment: ""), image: UIImage(resource: .category), selectedImage: UIImage(resource: .category)),
            createTabBarController(for: WebtoonViewController(), title: NSLocalizedString("웹툰", comment: ""), image: UIImage(resource: .wallet), selectedImage: UIImage(resource: .wallet)),
            createTabBarController(for: SearchViewController(), title: NSLocalizedString("찾기", comment: ""), image: UIImage(resource: .search), selectedImage: UIImage(resource: .search)),
            createTabBarController(for: ArchiveViewController(), title: NSLocalizedString("보관함", comment: ""), image: UIImage(resource: .folder), selectedImage: UIImage(resource: .folder))
        ]
    }
    
    private func createTabBarController(for rootViewController: UIViewController, title: String?, image: UIImage, selectedImage: UIImage) -> UIViewController {
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image.withTintColor(.grey500, renderingMode: .alwaysOriginal)
        rootViewController.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        return rootViewController
    }
}
