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
            first()
                .tabItem {
                    Label("Budget Maker", systemImage: "house")
                }
        }
        .background(Color.black.opacity(1))
    }
}

#Preview {
    SwiftUIView()
}
