//
//  SliderScreen.swift
//  HomeWorkLesson3.4
//
//  Created by Олейник Богдан on 07.03.2022.
//

import SwiftUI

struct SliderScreen: View {
    
    @Binding var currentSliderValue: Double
    
    let color: UIColor
    let alpha: Int
    let targetValue: Int
    
    var body: some View {
        VStack {
            Text("Попадите как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                    .foregroundColor(.orange)
                SliderView(sliderValue: $currentSliderValue, color: color, alpha: alpha)
                Text("100")
                    .foregroundColor(.orange)
            }
            .padding()
        }
        
    }
}

struct SliderScreen_Previews: PreviewProvider {
    static var previews: some View {
        SliderScreen(
            currentSliderValue: .constant(50),
            color: .orange,
            alpha: 100,
            targetValue: 100
        )
    }
}
