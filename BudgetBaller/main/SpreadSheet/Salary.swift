//
//  Salary.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 4/20/25.
//

import SwiftUI

struct Salary: View {
    @State public var income = ""
    @State private var isLoggedIn: Bool = false
    
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 15))
                    
                  
                    
                    VStack{
                        Text("Income")
                            .font(.system(size: 60, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("")
                            .font(.system(size: 30, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)
                }
                .frame(width: 750, height: 400)
                .offset(y: -225)
                
                
                Text("The first step is to find your income")
                .font(.system(size: 20, weight: .light, design: .default))
                .frame(width: 390, height: 20)
                .offset(y: -190)
                
                VStack{
                    Text("Your Monthly Income:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $income, title: "Income:")
                        .keyboardType(.decimalPad)
                    Text("Income: \(income)")
                    
                    
                    
                    VStack(spacing: 24) {
                        Button {
                            if income != "" {
                                isLoggedIn = true
                            }
                        } label: {
                            Text("Next -->")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                        .frame(width: 250)
                        .offset(y: 0) // ✅ Your custom offset
                    }
                    // ✅ Navigation trigger using state binding
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Housing()
                        SpreadSheetMain()
                            .offset(y:500)
                    }
                }
                .frame(width: 390, height: 180)
                .offset(y: -150)
                
                
            }
        }
    }
}

#Preview {
    Salary()
}
