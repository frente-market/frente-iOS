//
//  HomeView.swift
//  App
//
//  Created by JunnKyuu on 6/4/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let price: Int
    let image: String
    let status: String
}

struct HomeView: View {
    @State private var selectedProduct: Product? = nil
    let sampleItems = (0..<10).map { _ in
        Product(
            title: "수원삼성 짭트로 L",
            category: "유니폼",
            price: 70000,
            image: "sample-product",
            status: "판매중"
        )
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(spacing: 0) {
                    // 헤더
                    HStack {
                        Text("FRENTE")
                            .font(.custom("GmarketSansBold", size: 23))
                            .foregroundColor(Color("suwonBlue"))
                        Spacer()
                        HStack(spacing: 20) {
                            Button(action: { print("메뉴 버튼 클릭") }) {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(Color.primary)
                            }
                            Button(action: { print("검색 버튼 클릭") }) {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.primary)
                            }
                            Button(action: { print("알림 버튼 클릭") }) {
                                Image(systemName: "bell")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.primary)
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    
                    // 리스트
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(sampleItems) { item in
                                Button {
                                    selectedProduct = item
                                } label: {
                                    HStack(spacing: 16) {
                                        Image(item.image)
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(item.title)
                                                .font(.custom("GmarketSansBold", size: 17))
                                                .foregroundColor(Color.primary)
                                            Text(item.category)
                                                .font(.custom("GmarketSansMedium", size: 12))
                                                .foregroundColor(.gray)
                                            Text("\(item.price)원")
                                                .font(.custom("GmarketSansMedium", size: 14))
                                                .foregroundColor(Color.primary)
                                        }
                                        Spacer()
                                        Text(item.status)
                                            .font(.custom("GmarketSansBold", size: 15))
                                            .foregroundColor(Color("suwonBlue"))
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
            .fullScreenCover(item: $selectedProduct) { _ in
                DetailView()
            }
        }
    }
}

#Preview {
    HomeView()
}
