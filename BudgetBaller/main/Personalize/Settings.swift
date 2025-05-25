//
//  Settings.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 5/24/25.
//

import SwiftUI

struct Settings: View {
    @State private var homeExpanded = false
    @State private var profileExpanded = false
    @State private var settingsExpanded = false
    @State private var locationsExpanded = false
    var body: some View {
        NavigationStack{
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 15))
                    
                    
                    
                    VStack{
                        Text("Settings")
                            .font(.system(size: 60, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("Settings")
                            .font(.system(size: 30, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)
                }
                .frame(width: 750, height: 400)
                .offset(y: -205)
                
                VStack {
                    Text("Welcome to Settings!")
                        .font(.largeTitle)
                        .offset(y: -200)
                    
                    List {
                        
                        Text("Options")
                            .font(.largeTitle)
                        
                        DisclosureGroup("Home", isExpanded: $homeExpanded) {
                            NavigationLink(destination: first()) {
                                Label("Dashboard", systemImage: "house.fill")
                            }
                            NavigationLink(destination: Text("Activity")) {
                                Label("Activity", systemImage: "list.bullet")
                            }
                        }
                        
                        DisclosureGroup("Profile", isExpanded: $profileExpanded) {
                            NavigationLink(destination: ProfileView()) {
                                Label("View Profile", systemImage: "person.crop.circle")
                            }
                            NavigationLink(destination: ProfileView()) {
                                Label("Edit Profile", systemImage: "pencil")
                            }
                        }
                        
                        DisclosureGroup("Settings", isExpanded: $settingsExpanded) {
                            NavigationLink(destination: Settings()) {
                                Label("General", systemImage: "gearshape")
                            }
                            NavigationLink(destination: Settings()) {
                                Label("Privacy", systemImage: "lock.shield")
                            }
                        }
                        DisclosureGroup("Locations", isExpanded: $locationsExpanded) {
                            NavigationLink(destination: cutdown()) {
                                Label("General Spots", systemImage: "location")
                            }
                            NavigationLink(destination: cutdown()) {
                                Label("Where u at???", systemImage: "map")
                            }
                        }
                        
                    }
                    .frame(width: 400, height: 300)// ✅ Use NavigationStack (iOS 16+)
                    .offset(x: 0, y: -200)
                    VStack(spacing: 24) {
                    }
                }
            }

        }
    }
}

#Preview {
    Settings()
}
