//
//  SidebarView.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 5/24/25.
//


import SwiftUI

struct SidebarView: View {
        @State private var homeExpanded = false
        @State private var profileExpanded = false
        @State private var settingsExpanded = false
        @State private var locationsExpanded = false
        
        var body: some View {
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
            .listStyle(SidebarListStyle())
        }
}

