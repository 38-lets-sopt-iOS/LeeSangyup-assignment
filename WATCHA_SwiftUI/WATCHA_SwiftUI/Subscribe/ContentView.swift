//
//  ContentView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView {
                SubscribeView()
                NewContentsView()
                WatgorithmView()
                CommingSoonView()
                WatchaPartyView()
            }
        }
        .background(.black)
    }
}
