//
//  ContentView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section(header: HeaderView()) {
                            SubscribeView()
                            NewContentsView()
                            WatgorithmView()
                            CommingSoonView()
                            WatchaPartyView()
                        }
                    }
                }
                .background(.black)
                
                Color.black
                    .frame(height: geometry.safeAreaInsets.top)
                    .ignoresSafeArea(edges: .top)
            }
        }
    }
}
