//
//  ChatListView.swift
//  App
//
//  Created by JunnKyuu on 6/4/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    @State private var selectedChatRoom: ChatRoom? = nil
    let chatRooms = ChatRoom.sampleChatRooms
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(spacing: 0) {
                    // 헤더
                    HStack {
                        Text("채팅")
                            .font(.custom("GmarketSansBold", size: 23))
                            .foregroundColor(Color("suwonBlue"))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    
                    Divider()
                        .padding(.bottom, 5)
                    
                    // 채팅방 리스트
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(chatRooms) { chatRoom in
                                Button {
                                    selectedChatRoom = chatRoom
                                } label: {
                                    HStack(spacing: 16) {
                                        // 상품 이미지
                                        Image(chatRoom.productImage)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            // 상품명
                                            Text(chatRoom.productTitle)
                                                .font(.custom("GmarketSansBold", size: 15))
                                                .foregroundColor(Color.primary)
                                            
                                            // 마지막 메시지
                                            Text(chatRoom.lastMessage)
                                                .font(.custom("GmarketSansLight", size: 14))
                                                .foregroundColor(.gray)
                                                .lineLimit(1)
                                        }
                                        
                                        Spacer()
                                        
                                        // 시간
                                        Text(formatDate(chatRoom.lastMessageTime))
                                            .font(.custom("GmarketSansLight", size: 12))
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
            .fullScreenCover(item: $selectedChatRoom) { chatRoom in
                ChatDetailView(chatRoom: chatRoom)
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}

#Preview {
    ChatListView()
}
