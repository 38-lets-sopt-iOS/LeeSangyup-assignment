//
//  CommingSoonView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct CommingSoonView: View {
    let row = [ GridItem(.flexible()) ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Text("공개 예정 콘텐츠")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Spacer()
                
                Button {
                    
                } label: {
                    Text("더보기")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
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
            }
        }
        .padding(.top, 45)
    }
}

