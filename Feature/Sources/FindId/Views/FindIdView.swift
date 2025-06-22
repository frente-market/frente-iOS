//
//  FindIdView.swift
//  App
//
//  Created by JunnKyuu on 6/22/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct FindIDView: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    // sample data
    @State private var phone: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundStyle(Color.primary)
            }
            
            Spacer()
                .frame(height: 15)
            
            Text("아이디 찾기")
                .font(.custom("GmarketSansBold", size: 25))
                .padding(.top, 5)
            
            Text("회원가입할 때 입력한 휴대폰 번호를 입력해주세요.")
                .font(.custom("GmarketSansLight", size: 12))
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            // 입력 필드를 감싸는 카드 뷰
            VStack(spacing: 0) {
                TextField("휴대폰 번호", text: $phone)
                    .font(.custom("GmarketSansLight", size: 15))
                    .padding()
                    .focused($isFocused)
                    .submitLabel(.done)
                    .keyboardType(.numberPad)
                    .autocapitalization(.none)
//                    .onSubmit {
//                        viewModel.findID()
//                    }
            }
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 20)
            
            // 아이디 찾기 버튼
            Button(action: {
//                viewModel.findID()
                print("findId 클릭")
            }) {
                Text("아이디 찾기")
                    .font(.custom("GmarketSansMedium", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("suwonBlue"))
                            .opacity(phone.isEmpty ? 0.5 : 1)
                    )
            }
            .disabled(phone.isEmpty)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
//        .alert(viewModel.isSuccess ? "아이디 찾기 성공" : "아이디 찾기 실패", isPresented: $viewModel.showAlert) {
//            Button("확인") {
//                if viewModel.isSuccess {
//                    dismiss()
//                }
//            }
//        } message: {
//            Text(viewModel.isSuccess ? "아이디: \(viewModel.userID)" : viewModel.alertMessage)
//        }
        .interactiveDismissDisabled()
        .navigationBarHidden(true)
    }
}

#Preview {
    FindIDView()
}
