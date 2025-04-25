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

    init(
        salary1: String = String(Sheet().income),
        housing1: String = String(Sheet().rent),
        housing2: String = String(Sheet().utilities),
        car1: String = String(Sheet().lease),
        car2: String = String(Sheet().mileage),
        gas: String = String(Sheet().gas)
        
    ) {
        _salary1 = State(initialValue: salary1)
        _housing1 = State(initialValue: housing1)
        _housing2 = State(initialValue: housing2)
        _car1 = State(initialValue: car1)
        _car2 = State(initialValue: car2)
        _gas = State(initialValue: gas)
    }

    var body: some View {
        VStack {
            Text("Salary: \(salary1)")
            Text("Housing: \(housing1)")
            Text("Homeowners Insurance: \(housing2)")
            Text("Car Payment \(car1)")
            Text("Car Insurance: \(car2)")
            Text("Gas: \(gas)")
        }
    }
}

#Preview {
    SpreadSheetMain()
}
