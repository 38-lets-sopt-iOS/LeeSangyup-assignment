//
//  WelcomeView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/29/26.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isMainPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                Image("watchaLogo")
                    .padding(.top, 42)
                
                Text("회원님\n가입을 환영합니다!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 54)
                
                Spacer()
                
                Button {
                    isMainPresented = true
                } label: {
                    Text("메인으로")
                        .padding(.horizontal, 134)
                        .padding(.vertical, 17)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.bottom, 13)
            }
            .frame(maxWidth: .infinity)
            .background(.black)
            .navigationDestination(isPresented: $isMainPresented) {
                TabBarView()
            }
        }
    }
}
