import UIKit

struct CalculatorBrain {
    private var bmi: BMI?
    
    mutating func calculate(height: Float, weight: Float) {
        let bmiValue = round((weight / (height * height)) * 10) / 10
        
        if(bmiValue<18.5){
            bmi = BMI(value: bmiValue, color: UIColor.systemTeal, advice: "Start Bulking bitch")
        }else if(bmiValue < 24.9){
            bmi = BMI(value: bmiValue, color: UIColor.systemGreen, advice: "Build more muscles pal")
        }else{
            bmi = BMI(value: bmiValue, color: UIColor.systemOrange, advice: "Start running Fatass")
        }
       
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice()->String{
        return bmi?.advice ?? "default advice"
    }
    
    func getColor()->UIColor{
        return bmi?.color ?? UIColor.black
    }
}
