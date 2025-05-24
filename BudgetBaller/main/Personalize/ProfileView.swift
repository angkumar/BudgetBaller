//
//  ProfileView.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 5/24/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 15))
                    
                  
                    
                    VStack{
                        Text("Profile")
                            .font(.system(size: 60, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("Your Profile")
                            .font(.system(size: 30, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)
                }
                .frame(width: 750, height: 400)
                .offset(y: -250)
                
                VStack {
                    Text("Welcome to BudgetBaller!")
                        .font(.largeTitle)
                    
                }
                .frame(width: 390, height: 180)
                .offset(y: -200)// ✅ Use NavigationStack (iOS 16+)
                VStack(spacing: 24) {
                }
                        }
                    }
                
            }
}

#Preview {
    ProfileView()
}
