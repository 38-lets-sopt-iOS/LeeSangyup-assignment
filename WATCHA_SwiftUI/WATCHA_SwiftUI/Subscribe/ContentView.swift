//
//  ContentView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentedAlert = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section(header: HeaderView(isPresentedAlert: $isPresentedAlert)) {
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
                    .frame(maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea(edges: .top)
                
                if isPresentedAlert {
                    AlertView(isPresentedAlert: $isPresentedAlert)
                        .padding(.bottom, 14)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
}
