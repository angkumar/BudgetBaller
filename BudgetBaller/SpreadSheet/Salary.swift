//
//  Salary.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 4/20/25.
//

import SwiftUI

struct Salary: View {
    @State public var income: String = ""
    
    var body: some View {
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
        .offset(y: -350)
        
        Text("The first step to budgeting is to figure out how much money you make each month.")
        .font(.system(size: 20, weight: .light, design: .default))
        .offset(y: -250)
        
        VStack{
            Text("Your Annual Income:")
                .font(.system(size: 20, weight: .light, design: .default))
            InputFieldView(data: $income, title: "Username or email:")
            let income1 = Int(income)
            let monthly = income1! / 12
            
            
        }
    }
}

#Preview {
    Salary()
}
