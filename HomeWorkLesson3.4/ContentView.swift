//
//  ContentView.swift
//  HomeWorkLesson3.4
//
//  Created by Олейник Богдан on 07.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            SliderScreen(
                currentSliderValue: $currentValue,
                color: .orange,
                alpha: score(),
                targetValue: targetValue
            )
            
            ButtonView(
                showAlert: $showAlert,
                title: "Узнать результат",
                score: score(),
                action: { showAlert.toggle() }
            )
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
    private func score() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct ButtonView: View {
    
    @Binding var showAlert: Bool
    
    let title: String
    let score: Int
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .alert("Score", isPresented: $showAlert, actions: {}) {
                Text("\(score)")
            }
    }
    
    init(showAlert: Binding<Bool> =
            .constant(false),
         title: String,
         score: Int = 0,
         action: @escaping () -> Void
    ) {
        
        self._showAlert = showAlert
        self.title = title
        self.score = score
        self.action = action
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
