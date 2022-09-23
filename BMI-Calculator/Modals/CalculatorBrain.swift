//
//  CalculatorBrain.swift
//  BMI-Calculator
//
//  Created by Utku Kaan Gülsoy on 22.09.2022.
//

import UIKit
struct CalculatorBrain{
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (pow(height, 2))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice:"Eat more pies!", color: .cyan )
            
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice:"Fit as a fiddle!", color: .green )
            
        }else{
            bmi = BMI(value: bmiValue, advice:"Eat less pies!", color: .magenta)
            
        }
        
        
    }
    
    func getBMIValue() -> String{
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
        
    }
    
    func getColor() -> UIColor{
        if bmi != nil {
            return bmi!.color
        }else{
            return UIColor.brown
        }
    }
}
