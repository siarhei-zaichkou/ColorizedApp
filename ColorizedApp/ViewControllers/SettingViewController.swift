

import UIKit

class SettingViewController: UIViewController {

    // MARK: - @IBOutlets
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    var viewColor: UIColor!
    var delegate: SettingViewControllerDelegate!
    var rgbColors: CIColor {
        CIColor(color: viewColor)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(redColorSlider, color: rgbColors.red)
        setupSlider(greenColorSlider, color: rgbColors.green)
        setupSlider(blueColorSlider, color: rgbColors.blue)
        
        setValue(for: redColorValue, greenColorValue, blueColorValue)
        colorizedView.backgroundColor = viewColor
        colorizedView.layer.cornerRadius = 15
    }
    
    // MARK: - @IBActions
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redColorValue.text = string(from: redColorSlider)
        case greenColorSlider:
            greenColorValue.text = string(from: greenColorSlider)
        default:
            blueColorValue.text = string(from: blueColorSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setBackground(color: colorizedView.backgroundColor)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupSlider(_ slider: UISlider, color: CGFloat) {
        slider.value = Float(color)
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        // корявенько с ифами, зато работает :)
        if slider == redColorSlider {
            slider.minimumTrackTintColor = .red
        } else if slider == greenColorSlider {
            slider.minimumTrackTintColor = .green
        } else if slider == blueColorSlider {
            slider.minimumTrackTintColor = .blue
        }
    }
    
    private func setColor() {
        colorizedView.backgroundColor = UIColor.init(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorValue:
                redColorValue.text = string(from: redColorSlider)
            case greenColorValue:
                greenColorValue.text = string(from: greenColorSlider)
            default:
                blueColorValue.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

