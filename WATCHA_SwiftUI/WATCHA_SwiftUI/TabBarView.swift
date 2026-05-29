//
//  TabBarView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/29/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("구독", image: "subscribe") {
                ContentView()
            }
            Tab("개별 구매", image: "category") { EmptyView() }
            Tab("웹툰", image: "wallet") { EmptyView() }
            Tab("찾기", image: "search") { EmptyView() }
            Tab("보관함", image: "folder") { EmptyView() }
        }
        .tint(.white)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().unselectedItemTintColor = .gray
        }
        .navigationBarBackButtonHidden(true)
    }
}
