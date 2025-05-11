//
//  cutdown.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 5/10/25.
//

import SwiftUI

struct cutdown: View {
    @State private var salary1: String
    @State private var housing1: String
    @State private var housing2: String
    @State private var car1: String
    @State private var car2: String
    @State private var gas: String
    @State private var isLoggedIn: Bool = false
    
    init(sheet: SpreadSheetMain = SpreadSheetMain()) {
        _salary1 = State(initialValue: String(sheet.salary1))
        _housing1 = State(initialValue: String(sheet.housing1))
        _housing2 = State(initialValue: String(sheet.housing2))
        _car1 = State(initialValue: String(sheet.car1))
        _car2 = State(initialValue: String(sheet.car2))
        _gas = State(initialValue: String(sheet.gas))
    }
    
    var total: Double {
        _ = Double(salary1) ?? 0
        let housing = Double(housing1) ?? 0
        let utilities = Double(housing2) ?? 0
        let carLease = Double(car1) ?? 0
        let carInsurance = Double(car2) ?? 0
        let gasExpense = Double(gas) ?? 0
        
        return housing
        return utilities
        return carLease
        return carInsurance
        return gasExpense
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Here is how to help you cut down on expenses!")
                .font(.largeTitle)
                .padding()

            Text("Total Expendature: \(total, specifier: "%.2f")")
                .font(.title2)

            ForEach(checkerMessages(), id: \.self) { message in
                Text(message)
                    .foregroundColor(message.contains("too much") ? .red : .green)
            }
        }
        .padding()
    }
    
    func checkerMessages() -> [String] {
        let list = [
            Double(housing1) ?? 0,
            Double(housing2) ?? 0,
            Double(car1) ?? 0,
            Double(car2) ?? 0,
            Double(gas) ?? 0
        ] as [Any]

        let itemNames = ["Housing 1", "Housing 2", "Car 1", "Car 2", "Gas"]
        var messages: [String] = []

        for (index, value) in list.enumerated() {
            if value as! Int > 200 {
                messages.append("\(itemNames[index]) is too much")
            } else {
                messages.append("\(itemNames[index]) is ok")
            }
        }

        return messages
    }
}

#Preview {
    cutdown()
}
