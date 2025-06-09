//
//  SwiftUIView.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 5/24/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        TabView {
            first()
                .tabItem {
                    Label("Budget Maker", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            GeminiChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
        }
        .background(Color.black.opacity(1))
    }
}

#Preview {
    SwiftUIView()
}
