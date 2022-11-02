//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Sergey on 30.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(redColorSlider, color: .red)
        setupSlider(greenColorSlider, color: .green)
        setupSlider(blueColorSlider, color: .blue)
        
        setValue(for: redColorValue, greenColorValue, blueColorValue)
        
        colorizedView.layer.cornerRadius = 15
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redColorValue.text = string(from: redColorSlider)
        case greenColorSlider:
            greenColorValue.text = string(from: greenColorSlider)
        default:
            blueColorValue.text = string(from: blueColorSlider)        }
    }
    
    private func setupSlider(_ slider: UISlider, color: UIColor) {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
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

