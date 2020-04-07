//
//  SettingsViewController.swift
//  KVODemo
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let newSize = Int(sender.value)
        Settings.shared.fontSize = newSize
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    private var fontSizeObservation: NSKeyValueObservation?
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureFontSizeObservation()
    }
    
    private func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let fontSize = change.newValue else { return }
            self?.fontSizeLabel.text = fontSize.description
        })
    }

}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return iconNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return iconNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let iconName = iconNames[row]
        Settings.shared.iconName = iconName
    }
}
