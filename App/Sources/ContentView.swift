//
//  ContentView.swift
//  frente-iOS
//
//  Created by JunnKyuu on 6/2/25.
//

import SwiftUI

struct ContentView: View {
    private var isLoginSample: Bool = false
    
    var body: some View {
        if isLoginSample {
            MainTabView()
        } else {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
