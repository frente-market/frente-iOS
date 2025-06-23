//
//  WelcomeView.swift
//  App
//
//  Created by JunnKyuu on 6/7/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

public struct WelcomeView: View {
    @State private var isLogin: Bool = false
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(spacing: 10) {
                    Text("FRENTE")
                        .font(.custom("GmarketSansBold", size: 55))
                        .foregroundStyle(.white)
                    Text("By Suwon Fans, For Suwon Fans")
                        .font(.custom("GmarketSansMedium", size: 13))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 15)

                Text("수원삼성 팬 누구나 참여 가능한\n실명 기반 안전 중고거래 플랫폼")
                    .font(.custom("GmarketSansMedium", size: 13))
                    .lineSpacing(5)
                    .foregroundStyle(.white)
                
                Spacer()
                
                if(isLogin) {
                    NavigationLink(destination: MainTabView()) {
                        Text("시작하기")
                            .font(.custom("GmarketSansMedium", size: 18))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(.white)
                            .foregroundColor(Color("suwonBlue"))
                            .cornerRadius(14)
                    }
                } else {
                    NavigationLink(destination: LoginView()) {
                        Text("시작하기")
                            .font(.custom("GmarketSansMedium", size: 18))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(.white)
                            .foregroundColor(Color("suwonBlue"))
                            .cornerRadius(14)
                    }
                }
                
                
                HStack(spacing: 20) {
                    NavigationLink(destination: SignUpView()) {
                        Text("회원가입")
                            .font(.custom("GmarketSansMedium", size: 15))
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .frame(height: 15)
                        .background(Color.white)
                    
                    NavigationLink(destination: FindIDView()) {
                        Text("아이디 찾기")
                            .font(.custom("GmarketSansMedium", size: 15))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 10)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color("suwonBlue"))
        }

    }
}

#Preview {
    WelcomeView()
}
