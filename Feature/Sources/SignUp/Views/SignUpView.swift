//
//  SignUpView.swift
//  App
//
//  Created by JunnKyuu on 6/7/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = SignUpViewModel()
    @State private var currentPage: SignUpPage = .agree
    
    var body: some View {
        NavigationStack {
            VStack {
                switch currentPage {
                case .agree:
                    SignUpAgreementView(isAgreeAll: $viewModel.isAgreeAll,
                                        onBack: { dismiss() },
                                        onNext: {
                        if viewModel.isAgreeAll {
                            withAnimation {
                                currentPage = .phone
                            }
                        }
                    })
                case .phone:
                    InputPhoneView(onBack: {
                        dismiss()
                    }, onNext: {
                        print("클릭")
                    })
                }
            }
            .navigationBarHidden(true)
        }
    }
    
}
#Preview {
    SignUpView()
}
