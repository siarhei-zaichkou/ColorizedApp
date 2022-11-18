

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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var viewColor: UIColor!
    var delegate: SettingViewControllerDelegate!
    private var rgbColors: CIColor {
        CIColor(color: viewColor)
    }
    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(redColorSlider, color: rgbColors.red)
        setupSlider(greenColorSlider, color: rgbColors.green)
        setupSlider(blueColorSlider, color: rgbColors.blue)
        
        setValue(for: redColorValue, greenColorValue, blueColorValue)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        colorizedView.backgroundColor = viewColor
        colorizedView.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - @IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redColorValue.text = string(from: redColorSlider)
            setValue(for: redTextField)
        case greenColorSlider:
            greenColorValue.text = string(from: greenColorSlider)
            setValue(for: greenTextField)
        default:
            blueColorValue.text = string(from: blueColorSlider)
            setValue(for: blueTextField)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(colorizedView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupSlider(_ slider: UISlider, color: CGFloat) {
        slider.value = Float(color)
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        // корявенько с ифами, зато работает :)
        switch slider {
        case redColorSlider: slider.minimumTrackTintColor = .red
        case greenColorSlider: slider.minimumTrackTintColor = .green
        default: slider.minimumTrackTintColor = .blue
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
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = string(from: redColorSlider)
            case greenTextField:
                greenTextField.text = string(from: greenColorSlider)
            default:
                blueTextField.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc func didTapDone() {
        view.endEditing(true)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redColorValue)
            case greenTextField:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenColorValue)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueColorValue)
            }
            setColor()
            return
        }
        showAlert(title: "Wrong format", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
