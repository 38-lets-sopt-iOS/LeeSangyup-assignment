//
//  EmptyView.swift
//  WATCHA_SwiftUI
//
//  Created by 이상엽 on 5/29/26.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Text("비어있는 뷰")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
