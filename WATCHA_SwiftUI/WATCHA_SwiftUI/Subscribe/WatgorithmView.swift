//
//  WatgorithmView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct WatgorithmView: View {
    let row = [ GridItem(.flexible()) ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("watgorithm")
                .padding(.leading, 20)
            
            HStack(alignment: .top, spacing: 0) {
                Text("예능부터 드라마까지!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)

                Spacer()
                
                Button {
                    
                } label: {
                    Text("더보기")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8.5)
            .padding(.bottom, 7)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: row) {
                    ForEach(1...5, id: \.self) { index in
                        Image("movie\(index)")
                            .resizable()
                            .frame(width:103, height: 155)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                }
                .padding(.leading, 14)
            }
        }
        .padding(.top, 45)
    }
}
