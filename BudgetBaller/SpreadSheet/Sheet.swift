//
//  Sheet.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 4/25/25.
//

import SwiftUI

struct Sheet: View {
    @State public var income = ""
    @State private var isLoggedIn: Bool = false
    @State public var rent = ""
    @State public var utilities = ""
    @State public var lease = ""
    @State public var mileage = ""
    @State public var gas = ""
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 15))
                    
                  
                    
                    VStack{
                        Text("Budget Baller")
                            .font(.system(size: 60, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("Lets GOOO!")
                            .font(.system(size: 30, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)
                }
                .frame(width: 750, height: 400)
                .offset(y: -225)
                
                
                
                
                VStack{
                    Text("The first step is to find your income")
                    .font(.system(size: 20, weight: .light, design: .default))
                    .frame(width: 390, height: 20)
                    .offset(y: 0)
                    
                    Text("Your Monthly Income:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $income, title: "Income:")
                        .keyboardType(.decimalPad)
                    Text("Income: \(income)")
                    Text("Your Monthly Spending on Housing (Rent) and insurance:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $rent, title: "Rent/Mortgage Amount")
                        .keyboardType(.decimalPad)
                    Text("Amount: \(rent)")
                    InputFieldView(data: $utilities, title: "House Insurance per month")
                        .keyboardType(.decimalPad)
                    Text("Amount: \(utilities)")
                    Text("Your Monthly Spending on your car:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $lease, title: "amount for the car:")
                        .keyboardType(.decimalPad)
                    Text("amount: \(lease)")
                    InputFieldView(data: $mileage, title: "amount for car insurance:")
                        .keyboardType(.decimalPad)
                    Text("amount: \(mileage)")
                    Text("Your Monthly Spending on gas for your car:")
                        .font(.system(size: 20, weight: .light, design: .default))
                    InputFieldView(data: $gas, title: "Amount:")
                        .keyboardType(.decimalPad)
                    Text("Amount: \(gas)")
                    
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
                        SpreadSheetMain(salary1: income, housing1: rent, housing2: utilities, car1: lease, car2: mileage, gas: gas)
                            .offset(y:500)
                    }
                }
                .frame(width: 390, height: 180)
                .offset(y: 200)
                
                
            }
        }
    }
}

#Preview {
    Sheet()
}
