//
//  AlertView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/29/26.
//

import SwiftUI

struct AlertView: View {
    @Binding var isPresentedAlert: Bool
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Image("ticket")
            
            VStack(alignment: .leading, spacing: 0) {
                Text("매주 500편 이상 신작 업데이트!")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.top, 3)
                
                Button {
                    isPresentedAlert.toggle()
                } label: {
                    Text("구독 시작하기")
                        .font(.caption)
                        .foregroundStyle(.white)
                }
                .padding(.top, 13)
            }
            .padding(.leading, 10)
        }
        .padding(.leading, 16)
        .padding(.trailing, 23)
        .padding(.top, 14)
        .padding(.bottom, 10)

        .background(.pink)
        .clipShape(.rect(cornerRadius: 10))
    }
}

