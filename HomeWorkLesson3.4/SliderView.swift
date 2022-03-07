//
//  ViewController.swift
//  HomeWorkLesson3.4 UIKit
//
//  Created by Олейник Богдан on 07.03.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var sliderValue: Double
    
    let color: UIColor
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coorinator.sliderValueChange),
            for: .valueChanged
        )
        
        return slider
        
    }
    
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> Coorinator {
        Coordinator(sliderValue: $sliderValue)
    }
    
}

extension SliderView {
    class Coorinator: NSObject {
        
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderValueChange(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(50), color: .orange, alpha: 100)
    }
}
