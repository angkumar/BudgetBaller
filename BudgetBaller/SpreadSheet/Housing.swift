//
//  Housing.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 4/20/25.
//

import SwiftUI

struct Housing: View {
    @State public var rent = ""
    @State public var utilities = ""
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
                        Text("Housing")
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
                
                
                Text("The next step is to find Housing exenditures.")
                .font(.system(size: 20, weight: .light, design: .default))
                .frame(width: 390, height: 20)
                .offset(y: -185)
                
                VStack{
                    Text("Your Monthly Spending on Housing (Rent) and insurance:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $rent, title: "Rent/Mortgage Amount")
                        .keyboardType(.decimalPad)
                    Text("Amount: \(rent)")
                    InputFieldView(data: $utilities, title: "House Insurance per month")
                        .keyboardType(.decimalPad)
                    Text("Amount: \(utilities)")
                    
                    VStack(spacing: 24) {
                        Button {
                            if rent != "" {
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
                        car()                            }
                }
                .frame(width: 390, height: 180)
                .offset(y: -150)
                
                
            }
        }
    }
}

#Preview {
    Housing()
}
