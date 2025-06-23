//
//  AgreementButton.swift
//  App
//
//  Created by JunnKyuu on 6/23/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct AgreeButton: View {
    var title: String
    var subtitle: String
    var isAgree: Bool
    var showDetail: Bool = false
    var onDetail: (() -> Void)? = nil
    var onAgree: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onAgree) {
                HStack {
                    Image(systemName: isAgree ? "checkmark.square.fill" : "checkmark.square")
                        .font(.title2)
                        .foregroundStyle(isAgree ? Color("suwonBlue") : Color.gray.opacity(0.5))
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.custom("GmarketSansMedium", size: 16))
                        if !subtitle.isEmpty {
                            Text(subtitle)
                                .font(.custom("GmarketSansLight", size: 12))
                                .foregroundStyle(.gray)
                        }
                    }
                    .foregroundStyle(isAgree ? Color("suwonBlue") : Color.gray.opacity(0.5))
                }
            }
            
            Spacer()
            
            if showDetail {
                Button(action: { onDetail?() }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}
