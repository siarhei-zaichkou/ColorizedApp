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
        
        setupColorizedView()
    }

    @IBAction func redSliderAction() {
        redColorValue.text = String(format: "%.2f", redColorSlider.value)
        colorizedView.backgroundColor = UIColor.init(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
        colorizedView.backgroundColor = UIColor.init(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    @IBAction func bluerSliderAction() {
        blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
        colorizedView.backgroundColor = UIColor.init(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    private func setupSlider(_ slider: UISlider, color: UIColor) {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
    }
    
    private func setupColorizedView() {
        colorizedView.layer.cornerRadius = 15
        colorizedView.backgroundColor = UIColor.init(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value), alpha: 1)
    }

}

