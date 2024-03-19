//
//  ContentView.swift
//  Marafon17(TransitionButton)
//
//  Created by ViktorM1Max on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    
    @State private var buttonText = "Open"
    @State private var buttonImage = ""
    
    private let animationDuration = 0.4
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                if !isExpanded { Spacer() }
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: isExpanded ? 20 : 10)
                        .fill(.blue)
                        .frame(width: isExpanded ? 300 : 100, height: isExpanded ? 400 : 50)
                    
                    Button(action: {
                        withAnimation(.bouncy(duration: animationDuration)) {
                            isExpanded.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration*0.2) {
                            buttonText = isExpanded ? "Back" : "Open"
                            buttonImage = isExpanded ? "arrowshape.backward.fill" : "none"
                        }
                    }, label: {
                        HStack {
                            Image(systemName: buttonImage)
                            Text(buttonText).bold().offset(x: isExpanded ? 0 : -5, y: 0)
                        }
                        .foregroundStyle(.white)
                    })
                    .frame(width: 100, height: 50)
                }
            }
            
            if isExpanded { Spacer() }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
