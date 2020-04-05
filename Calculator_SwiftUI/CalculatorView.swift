//
//  CalculatorView.swift
//  Calculator_SwiftUI
//
//  Created by Adriano Ramos on 05/04/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import SwiftUI

struct CalculatorButton: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var color: Color = .darkGray
}

extension Color {
    static let lightGray = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let darkGray = Color(red: 0.2, green: 0.2, blue: 0.2)
}

struct CalculatorView: View {
    
    let buttons: [[CalculatorButton]] = [
        [.init(title: "AC", color: .lightGray),
         .init(title: "±", color: .lightGray),
         .init(title: "%", color: .lightGray),
         .init(title: "÷", color: Color.orange)],
        
        [.init(title: "7"),
         .init(title: "8"),
         .init(title: "9"),
         .init(title: "x", color: Color.orange)],
        
        [.init(title: "4"),
         .init(title: "5"),
         .init(title: "6"),
         .init(title: "-", color: Color.orange)],
        
        [.init(title: "1"),
         .init(title: "2"),
         .init(title: "3"),
         .init(title: "+", color: Color.orange)],
        
        [.init(title: "0"),
         .init(title: "."),
         .init(title: "=", color: Color.orange)]
    ]
    
    let spacing: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack (spacing: self.spacing) {
                    Spacer()
                    ForEach(self.buttons, id: \.self) { row in
                        CalculatorButtonsRow(width: geometry.size.width, spacing: self.spacing, buttons: row)
                    }
                }
            }
        }.background(Color.black)
    }
}

struct CalculatorButtonsRow: View {
    let width: CGFloat
    let spacing: CGFloat
    let buttons: [CalculatorButton]
    
    func getButtonWidth(title: String) -> CGFloat {
        return title != "0" ?
        (self.width - self.spacing * 5) / 4 :
        (self.width - self.spacing * 5) / 4 * 2 + self.spacing
    }
    
    var body: some View {
        HStack(spacing: self.spacing) {
            ForEach(self.buttons) { button in
                Text(button.title)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .frame(width: self.getButtonWidth(title: button.title),
                                               height: (self.width - self.spacing * 5) / 4)
                    .background(button.color)
                    .cornerRadius(100)
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

