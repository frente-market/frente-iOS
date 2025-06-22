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
    
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundStyle(Color.primary)
            }
            .padding(.top, 10)
            Text("SignUpView")

        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SignUpView()
}
