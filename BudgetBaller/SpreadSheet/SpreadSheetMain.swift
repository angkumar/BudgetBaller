//
//  SpreadSheetMain.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 4/25/25.
//

import SwiftUI

struct SpreadSheetMain: View {
    @State private var salary1: String
    @State private var housing1: String
    @State private var housing2: String
    @State private var car1: String
    @State private var car2: String
    @State private var gas: String
    @State private var isLoggedIn: Bool = false

    init(sheet: Sheet = Sheet()) {
        _salary1 = State(initialValue: String(sheet.income))
        _housing1 = State(initialValue: String(sheet.rent))
        _housing2 = State(initialValue: String(sheet.utilities))
        _car1 = State(initialValue: String(sheet.lease))
        _car2 = State(initialValue: String(sheet.mileage))
        _gas = State(initialValue: String(sheet.gas))
    }
    
    var total: Double {
        let salary = Double(salary1) ?? 0
        let housing = Double(housing1) ?? 0
        let utilities = Double(housing2) ?? 0
        let carLease = Double(car1) ?? 0
        let carInsurance = Double(car2) ?? 0
        let gasExpense = Double(gas) ?? 0
        
        return housing + utilities + carLease + carInsurance + gasExpense
    }

    var headerView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text("Budget Baller")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text("Your Budget Is Here!")
                    .font(.system(size: 30, weight: .light, design: .default))
                    .foregroundColor(.white)
            }
            .padding(.top, 125)
        }
        .frame(width: 750, height: 400)
        .offset(y: -200)
    }

    var detailView: some View {
        VStack {
            Text("Salary: \(salary1)")
                .padding(.vertical, 10)
            Text("Housing: \(housing1)")
                .padding(.vertical, 10)
            Text("Homeowners Insurance: \(housing2)")
                .padding(.vertical, 10)
            Text("Car Payment: \(car1)")
                .padding(.vertical, 10)
            Text("Car Insurance: \(car2)")
                .padding(.vertical, 10)
            Text("Gas: \(gas)")
                .padding(.vertical, 10)
            Text("Total: \(total, specifier: "%.2f")")
                .padding(.vertical, 10)
            Text("Money Left to spend: \((Double(salary1) ?? 0) - total)")
                .padding(.vertical, 10)
            if (Double(salary1) ?? 0) - total < 0 {
                Text("Ur broke ma boi Click below to save more -->")
            }
        }
        .frame(width: 350)
        .padding()
        .background(.ultraThinMaterial)
        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
        .font(.title2)
        .padding()
        .offset(y: -180)
    }

    var body: some View {
        ZStack {
            headerView
                .offset(y:-200)
            detailView
                .offset(y:240)
            
            VStack(spacing: 24) {
                Button {
                    if salary1 != "" {
                        isLoggedIn = true
                    }
                } label: {
                    Text("Click Here To Modify -->")
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
                Sheet()
            }
            .offset(y:350)
        }
    }
}

#Preview {
    SpreadSheetMain()
}
