//
//  PostingView.swift
//  App
//
//  Created by JunnKyuu on 6/5/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI
import PhotosUI

struct PostingView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("selectedTab") private var selectedTab: Int = 1
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    
    @FocusState private var titleFieldIsFocused: Bool
    @FocusState private var descriptionFieldIsFocused: Bool
    @FocusState private var priceFieldIsFocused: Bool
    
    var isFormValid: Bool {
        !title.isEmpty && !description.isEmpty && !price.isEmpty && Int(price) != nil && !selectedImages.isEmpty
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // 헤더
                HStack {
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primary)
                    }
                    Spacer()
                    Text("글쓰기")
                        .font(.custom("GmarketSansBold", size: 23))
                        .foregroundColor(Color("suwonBlue"))
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 5)
                
                Divider()
                    .padding(.bottom, 5)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 50) {
                        // 사진 첨부
                        VStack(alignment: .leading, spacing: 10) {
                            Text("사진 (최대 10장)")
                                .font(.custom("GmarketSansMedium", size: 17))
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(selectedImages, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70)
                                            .clipped()
                                            .cornerRadius(10)
                                    }
                                    if selectedImages.count < 10 {
                                        PhotosPicker(selection: $selectedItems, maxSelectionCount: 10 - selectedImages.count, matching: .images) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.gray.opacity(0.15))
                                                    .frame(width: 70, height: 70)
                                                Image(systemName: "camera.fill")
                                                    .font(.system(size: 27))
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, 2)
                            }
                            Text("\(selectedImages.count)/10")
                                .font(.custom("GmarketSansLight", size: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        .onChange(of: selectedItems) { newItems in
                            loadImages(from: newItems)
                        }
                        
                        // 제목
                        VStack(alignment: .leading, spacing: 8) {
                            Text("제목")
                                .font(.custom("GmarketSansMedium", size: 17))
                            TextField("제목을 입력해주세요.", text: $title)
                                .font(.custom("GmarketSansLight", size: 15))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(titleFieldIsFocused ? Color("suwonBlue") : Color.gray.opacity(0.4), lineWidth: 1.5)
                                )
                                .focused($titleFieldIsFocused)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal, 20)
                        
                        // 자세한 설명
                        VStack(alignment: .leading, spacing: 8) {
                            Text("자세한 설명")
                                .font(.custom("GmarketSansMedium", size: 17))
                            ZStack(alignment: .topLeading) {
                                if description.isEmpty {
                                    Text("거래를 위해 자세히 적어주세요.")
                                        .foregroundColor(Color.gray)
                                        .font(.custom("GmarketSansLight", size: 15))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 18)
                                }
                                TextEditor(text: $description)
                                    .font(.custom("GmarketSansLight", size: 15))
                                    .frame(height: 120)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 14)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(descriptionFieldIsFocused ? Color("suwonBlue") : Color.gray.opacity(0.4), lineWidth: 1.5)
                                    )
                                    .focused($descriptionFieldIsFocused)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // 가격
                        VStack(alignment: .leading, spacing: 8) {
                            Text("가격")
                                .font(.custom("GmarketSansMedium", size: 17))
                            HStack {
                                Text("₩")
                                    .font(.custom("GmarketSansLight", size: 16))
                                    .foregroundColor(.gray)
                                TextField("가격을 입력해주세요.", text: $price)
                                    .keyboardType(.numberPad)
                                    .font(.custom("GmarketSansLight", size: 15))
                                    .focused($priceFieldIsFocused)
                                    .onChange(of: price) { newValue in
                                        let filtered = newValue.filter { $0.isNumber }
                                        if filtered != newValue {
                                            price = filtered
                                        }
                                    }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(priceFieldIsFocused ? Color("suwonBlue") : Color.gray.opacity(0.4), lineWidth: 1.5)
                            )
                        }
                        .padding(.horizontal, 20)
                                                
                        // 하단 작성 완료 버튼
                        VStack {
                            Button {
                                selectedTab = 1
                            } label: {
                                Text("작성 완료")
                                    .font(.custom("GmarketSansMedium", size: 18))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .background(isFormValid ? Color("suwonBlue") : Color.gray.opacity(0.4))
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 18)
                            }
                            .disabled(!isFormValid)
                        }
                    }
                }
                .onTapGesture {
                    titleFieldIsFocused = false
                    descriptionFieldIsFocused = false
                    priceFieldIsFocused = false
                }
            }
        }
    }
    
    // PhotosPickerItem -> UIImage 변환
    private func loadImages(from items: [PhotosPickerItem]) {
        selectedImages = []
        for item in items.prefix(10) {
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    await MainActor.run {
                        selectedImages.append(uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    PostingView()
}
