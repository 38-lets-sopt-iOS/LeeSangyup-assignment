//
//  WatchaPartyView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct WatchaPartyView: View {
    let row = [ GridItem(.flexible()) ]
    let movieTitle = ["# 왕과 사는 남자", "# 파묘"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("왓챠 파티")
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
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: row) {
                    ForEach(1...2, id: \.self) { index in
                        ZStack(alignment: .topTrailing) {
                            VStack(alignment: .leading, spacing: 6) {
                                Image("party\(index)")
                                    .resizable()
                                    .frame(width: 196, height: 139)
                                
                                
                                Text("오늘 21:13에 시작")
                                    .font(.caption)
                                    .foregroundStyle(.pink)
                                    .padding(.leading, 8)
                                
                                Text(movieTitle[index - 1])
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 8)
                                    .padding(.bottom, 7)
                            }
                            .background(.secondary)
                            
                            Button {
                                
                            } label: {
                                Image("notificationCircle")
                            }
                            .padding(.top, 7)
                            .padding(.trailing, 5)
                        }
                        .padding(.leading, 14)
                    }
                }
            }
        }
        .padding(.top, 45)
    }
}
