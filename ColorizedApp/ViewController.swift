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
        
        setupSlider(slider: redColorSlider, color: .red)
        setupSlider(slider: greenColorSlider, color: .green)
        setupSlider(slider: blueColorSlider, color: .blue)
        
        
    
    }

    @IBAction func redSliderAction() {
        redColorValue.text = redColorSlider.value.formatted()
    }
    
    @IBAction func greenSliderAction() {
    }
    
    @IBAction func bluerSliderAction() {
    }
    
    private func setupSlider(slider: UISlider, color: UIColor) {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
    }
    

}

