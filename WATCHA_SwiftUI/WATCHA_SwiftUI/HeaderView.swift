//
//  HeaderView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/27/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("구독")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.trailing, 164.85)
                    .padding(.top, 28)
                    .padding(.leading, 27)
                    .padding(.bottom, 8)
                
                HStack(alignment: .center, spacing: 20.16) {
                    Button {
                        
                    } label: {
                        Image(.video)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(.notification)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(.profile)
                    }
                }
                .padding(.trailing, 30.24)
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.secondary)
        }
        .frame(width: 375, height: 69)
        .background(.black)
    }
}

#Preview{
    HeaderView()
}
