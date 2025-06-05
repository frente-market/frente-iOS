//
//  NoticeListView.swift
//  App
//
//  Created by JunnKyuu on 6/4/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct Notice: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: String
    let isImportant: Bool
}

struct NoticeListView: View {
    @State private var selectedNotice: Notice? = nil
    
    let sampleNotices = [
        Notice(
            title: "[공지] FRENTE 앱 출시 안내",
            content: "안녕하세요, FRENTE입니다.\n\n수원 삼성 블루윙즈 팬들을 위한 중고거래 플랫폼 FRENTE가 출시되었습니다.\n\n앞으로 많은 관심과 사랑 부탁드립니다.",
            date: "2025.06.05",
            isImportant: true
        ),
        Notice(
            title: "[안내] 서비스 이용 규칙",
            content: "안녕하세요, FRENTE입니다.\n\n서비스 이용 시 지켜주셔야 할 규칙을 안내드립니다.\n\n1. 욕설 및 비방 금지\n2. 허위 매물 등록 금지\n3. 직거래 시 안전한 장소 이용\n\n위 규칙을 지켜주시지 않을 경우 서비스 이용이 제한될 수 있습니다.",
            date: "2025.06.04",
            isImportant: true
        ),
        Notice(
            title: "[안내] 앱 업데이트 안내",
            content: "안녕하세요, FRENTE입니다.\n\n더 나은 서비스 제공을 위해 앱이 업데이트 되었습니다.\n\n주요 변경사항\n- UI/UX 개선\n- 성능 최적화\n- 버그 수정",
            date: "2025.06.03",
            isImportant: false
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(spacing: 0) {
                    // 헤더
                    HStack {
                        Text("공지사항")
                            .font(.custom("GmarketSansBold", size: 23))
                            .foregroundColor(Color("suwonBlue"))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    
                    Divider()
                        .padding(.bottom, 5)
                    
                    // 리스트
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(sampleNotices) { notice in
                                Button {
                                    selectedNotice = notice
                                } label: {
                                    HStack(spacing: 16) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            HStack(spacing: 8) {
                                                if notice.isImportant {
                                                    Text("중요")
                                                        .font(.custom("GmarketSansBold", size: 12))
                                                        .foregroundColor(.white)
                                                        .padding(.horizontal, 8)
                                                        .padding(.vertical, 4)
                                                        .background(Color("suwonBlue"))
                                                        .cornerRadius(4)
                                                }
                                                Text(notice.title)
                                                    .font(.custom("GmarketSansBold", size: 17))
                                                    .foregroundColor(Color.primary)
                                            }
                                            Text(notice.date)
                                                .font(.custom("GmarketSansLight", size: 14))
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.vertical, 16)
                                    .padding(.horizontal, 20)
                                    .background(Color.white)
                                }
                                Divider()
                                    .background(Color("suwonBlue").opacity(0.2))
                                    .padding(.leading, 20)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(item: $selectedNotice) { notice in
                NoticeDetailView(notice: notice)
            }
        }
    }
}

#Preview {
    NoticeListView()
}
