//
//  SplashView.swift
//  App
//
//  Created by JunnKyuu on 6/2/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    @State private var opacity: Double = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Text("FRENTE")
                    .font(.custom("GmarketSansBold", size: 55))
                    .foregroundStyle(.white)
                    .padding(.bottom, 10)
                Text("By Suwon Fans, For Suwon Fans")
                    .font(.custom("GmarketSansMedium", size: 13))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("suwonBlue"))
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    self.opacity = 1.0
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
