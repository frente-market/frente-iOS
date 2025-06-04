//
//  MainTabView.swift
//  App
//
//  Created by JunnKyuu on 6/4/25.
//  Copyright © 2025 frente. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("selectedTab") public var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("HOME", systemImage: "house.fill")
                }
                .tag(1)
            
            NoticeListView()
                .tabItem {
                    Label("NOTICE", systemImage: "bell.fill")
                }
                .tag(2)
            
            ChatListView()
                .tabItem {
                    Label("CHAT", systemImage: "message.fill")
                }
                .tag(3)
            
            MyPageView()
                .tabItem {
                    Label("MY", systemImage: "person.fill")
                }
                .tag(4)
        }
        .tint(Color("suwonBlue"))
    }
}

#Preview {
    MainTabView()
}
