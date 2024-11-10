import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    @IBOutlet var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial values for labels based on slider positions
        heightLabel.text = String(format: "%.2f", heightSlider.value) + "m"
        weightLabel.text = String(format: "%.0f", weightSlider.value) + "kg"
    }
    
    @IBAction func heightSliderFunction(_ sender: UISlider) {
        let height = sender.value
        heightLabel.text = String(format: "%.2f", height) + "m" // Format to 2 decimal places
    }

    @IBAction func weightSliderFunction(_ sender: UISlider) {
        let weight = sender.value
        weightLabel.text = String(format: "%.0f", weight) + "kg" // Format to 0 decimal places
    }
    
    @IBAction func calculateBtnPressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // Calculate BMI
        calculatorBrain.calculate(height: height, weight: weight)
        
        // Perform segue to ResultViewController
        self.performSegue(withIdentifier: "gotoResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculatorBrain.getBMI()
            resultVC.bmiAdvice = calculatorBrain.getAdvice()
            resultVC.bmiColor = calculatorBrain.getColor()
        }
    }
}
