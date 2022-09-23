//
//  CalculateViewControler.swift
//  BMI-Calculator
//
//  Created by Utku Kaan Gülsoy on 22.09.2022.
//

import UIKit

class CalculateViewControler: UIViewController {
    var calculatorBrain = CalculatorBrain()

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
       let roundedHeight = round(sender.value * 100) / 100
        heightLabel.text = "\(String(roundedHeight))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let roundedWeight = Int(sender.value)
        weightLabel.text = "\(String(roundedWeight))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

