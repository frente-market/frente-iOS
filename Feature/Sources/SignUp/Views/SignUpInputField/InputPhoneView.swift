//
//  InputPhoneView.swift
//  frente-iOS
//
//  Created by JunnKyuu on 6/23/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct InputPhoneView: View {
    var onBack:() -> Void
    var onNext:() -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button {
                onBack()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3.bold())
                    .foregroundStyle(Color.primary)
                    .contentShape(.rect)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 30)
            Text("실명인증")
                .font(.custom("GmarketSansBold", size: 28))
                .foregroundStyle(Color("suwonBlue"))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    InputPhoneView(onBack: {}, onNext: {})
}
