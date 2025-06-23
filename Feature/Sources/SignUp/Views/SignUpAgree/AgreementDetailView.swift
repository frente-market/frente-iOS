//
//  AgreementDetailView.swift
//  App
//
//  Created by JunnKyuu on 6/23/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct AgreementDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    // 제목, 내용 주입
    let title: String
    let content: String
    
    var body: some View {
        // 제목과 내용을 받아서 화면에 그리는 역할
            NavigationStack {
                ScrollView {
                    Text(content)
                        .font(.custom("GmarketSansLight", size: 14))
                        .foregroundStyle(Color.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("닫기") {
                            dismiss()
                        }
                        .foregroundStyle(Color.primary)
                    }
                }
            }
        }
}
