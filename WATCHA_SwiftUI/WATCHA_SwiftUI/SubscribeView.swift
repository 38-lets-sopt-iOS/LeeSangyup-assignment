//
//  SubscribeView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct SubscribeView: View {
    let row = [ GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: row) {
                ForEach(1...5, id: \.self) { index in
                    Image("movie\(index)")
                        .resizable()
                        .frame(width:273, height: 403)
                        .aspectRatio(contentMode: .fit)
                        .contentShape(.circle)
                        .clipShape(.rect(cornerRadius: 12))
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 50)
        .scrollTargetBehavior(.viewAligned)
        .padding(.top, 28)
    }
}
