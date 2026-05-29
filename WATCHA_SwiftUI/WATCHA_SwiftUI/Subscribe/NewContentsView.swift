//
//  NewContentsView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct NewContentsView: View {
    let row = [ GridItem(.flexible()) ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("방금 막 도착한 신상 컨텐츠")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("예능부터 드라마까지!")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .padding(.top, 3)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: row) {
                    ForEach(1...2, id: \.self) { index in
                        Image("newthing\(index)")
                            .resizable()
                            .frame(width:321, height: 180)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .padding(.top, 15)
        }
        .padding(.top, 34)
    }
}
