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
                    Label("홈", systemImage: "house.fill")
                }
                .tag(1)
            
            ChatListView()
                .tabItem {
                    Label("채팅", systemImage: "ellipsis.message.fill")
                }
                .tag(2)
            
            NavigationView {
                PostingView()
            }
            .tabItem {
                Label("글쓰기", systemImage: "plus.circle.fill")
            }
            .tag(3)
            
            NoticeListView()
                .tabItem {
                    Label("공지", systemImage: "bell.fill")
                }
                .tag(4)
            
            MyPageView()
                .tabItem {
                    Label("마이", systemImage: "person.fill")
                }
                .tag(5)
        }
        .tint(Color("suwonBlue"))
        .navigationBarHidden(true)
    }
}

#Preview {
    MainTabView()
}
