//
//  DetailView.swift
//  App
//
//  Created by JunnKyuu on 6/4/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct SampleData {
    let userName: String = "교동블루윙즈"
    let profileImage: String = "sample-profile"
    let title: String = "수원삼성 짭트로 L"
    let price: Int = 70000
    let content: String = "수원삼성 짭트로 유니폼 L사이즈입니다. 얼마 입지 않아서 상태 좋고, 광교역 인근에서 직거래 희망합니다!"
    let category: String = "유니폼"
    let status: String = "판매중"
    let images: [String] = [
        "sample-product",
        "sample-product",
        "sample-product",
        "sample-product",
        "sample-product"
    ]
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedIndex: Int = 0
    
    let sampleData = SampleData()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // 뒤로가기 버튼
                VStack(alignment: .leading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primary)
                            .contentShape(.rect)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                }
                .padding(.leading, 13)
                .padding(.top, 16)
                // 본문 스크롤
                ScrollView {
                    VStack(spacing: 0) {
                        // 상품 이미지
                        ZStack(alignment: .bottom) {
                            TabView(selection: $selectedIndex) {
                                ForEach(sampleData.images.indices, id: \.self) { idx in
                                    Image(sampleData.images[idx])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width, height: 400)
                                        .clipped()
                                        .tag(idx)
                                }
                            }
                            .frame(height: 400)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            
                            // 이미지 인디케이터
                            HStack(spacing: 6) {
                                ForEach(sampleData.images.indices, id: \.self) { idx in
                                    Circle()
                                        .fill(selectedIndex == idx ? Color.primary : Color.gray.opacity(0.7))
                                        .frame(width: 8, height: 8)
                                }
                            }
                            .padding(.bottom, 16)
                        }
                        // 본문
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 15) {
                                // 상품명, 카테고리
                                Text(sampleData.title)
                                    .font(.custom("GmarketSansBold", size: 20))
                                    .foregroundColor(Color.primary)
                            Text(sampleData.status)
                                .font(.custom("GmarketSansBold", size: 12))
                                .foregroundStyle(Color("suwonBlue"))
                                Spacer()
                                VStack(spacing: 20) {
                                    Text(sampleData.category)
                                        .font(.custom("GmarketSansMedium", size: 12))
                                        .foregroundColor(.gray)
                                }

                            }
                            .padding(.bottom, 3)

                            // 판매자 정보
                            HStack(spacing: 10) {
                                Image(sampleData.profileImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(15)
                                Text(sampleData.userName)
                                    .font(.custom("GmarketSansMedium", size: 13))
                                    .foregroundColor(Color.primary)
                            }
                            Divider()
                            .padding(.bottom, 15)
                            
                            
                            // 상품 설명
                            Text(sampleData.content)
                                .font(.custom("GmarketSansLight", size: 15))
                                .foregroundColor(.black)
                                .padding(.top, 4)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        Spacer(minLength: 40)
                    }
                }
            }
            // 가격, 채팅하기 버튼
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Text("\(sampleData.price)원")
                        .font(.custom("GmarketSansBold", size: 22))
                        .foregroundColor(Color.primary)
                    Spacer()
                    Button(action: { print("채팅하기 버튼 클릭") }) {
                        Text("채팅하기")
                            .font(.custom("GmarketSansMedium", size: 17))
                            .foregroundColor(.white)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 34)
                            .background(Color("suwonBlue"))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 13)
                .padding(.bottom, 35)
                .background(Color.white)
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DetailView()
}
