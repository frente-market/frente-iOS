//
//  LoginView.swift
//  App
//
//  Created by JunnKyuu on 6/6/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusField: Field?
    @State private var keyboardHeight: CGFloat = 0
    
    // sample data
    @State private var userId: String = ""
    @State private var password: String = ""
    
    enum Field {
        case id
        case password
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        dismiss()
                        if let tabSelection = UserDefaults.standard.value(forKey: "selectedTab") as? Int {
                            UserDefaults.standard.set(1, forKey: "selectedTab")
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primary)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("FRENTE 이용을 위해")
                            .font(.custom("GmarketSansBold", size: 23))
                            .foregroundStyle(Color.primary)
                        HStack(spacing: 0) {
                            Text("로그인")
                                .font(.custom("GmarketSansBold", size: 23))
                                .foregroundStyle(Color("suwonBlue"))
                            Text("을 해주세요.")
                                .font(.custom("GmarketSansBold", size: 23))
                                .foregroundStyle(Color.primary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // 입력 필드들을 감싸는 카드 뷰
                    VStack(spacing: 0) {
                        // 아이디 입력
                        TextField("아이디", text: $userId)
                            .font(.custom("GmarketSansLight", size: 15))
                            .padding()
                            .focused($focusField, equals: .id)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .password
                            }
                        
                        Divider()
                            .background(Color.gray.opacity(0.2))
                        
                        // 비밀번호 입력
                        SecureField("비밀번호", text: $password)
                            .font(.custom("GmarketSansLight", size: 15))
                            .padding()
                            .focused($focusField, equals: .password)
                            .submitLabel(.done)
                    }
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // 로그인 버튼
//                    Button(action: {
//                        print("로그인 버튼 클릭")
//                    }) {
//                        Text("로그인")
//                            .font(.custom("GmarketSansMedium", size: 16))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 15)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color("suwonBlue"))
//                                    .opacity(userId.isEmpty || password.isEmpty ? 0.1 : 1)
//                            )
//                    }
//                    .disabled(userId.isEmpty || password.isEmpty)
//                    .padding(.top, 20)
                    
                    NavigationLink(destination: MainTabView()) {
                        Text("로그인")
                            .font(.custom("GmarketSansMedium", size: 16))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("suwonBlue"))
                                    .opacity(userId.isEmpty || password.isEmpty ? 0.1 : 1)
                            )
                        
                    }
                    .disabled(userId.isEmpty || password.isEmpty)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
            }
            .navigationBarHidden(true)
            .scrollDismissesKeyboard(.immediately)
            .ignoresSafeArea(.keyboard)
    //        .overlay {
    //            if viewModel.isLoading {
    //                ProgressView()
    //                    .tint(.darkNavy)
    //                    .scaleEffect(1.5)
    //            }
    //        }
    //        .alert(viewModel.isSuccess ? "로그인에 성공했습니다." : "로그인에 실패했습니다.", isPresented: $viewModel.showAlert) {
    //            Button("확인") {
    //                if viewModel.isSuccess {
    //                    dismiss()
    //                }
    //            }
    //        } message: {
    //            Text(viewModel.alertMessage)
    //        }
        }
       
    }
}

#Preview {
    LoginView()
}
