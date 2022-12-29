//
//  BirthdateViewController.swift
//  PestanyasYDelegados
//
//  Created by TEO on 28/12/22.
//

import UIKit

protocol BirthdateViewControllerProtocol: AnyObject {
    func setBirthdate(_ birthdate: String)
}

class BirthdateViewController: UIViewController {
    
    let brain: BirthdateBrainProtocol = BirthdateBrain()
    @IBOutlet weak var birthdateTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateDatePicker()
        brain.setViewController(self)
    }
    
    func configurateDatePicker() {
        //MARK: - datePicker su modo de configuración será de fechas para este caso, teniendo presente que podría ser de fechas y tiempo, tiempo, conteo regresivo
        //MARK: - 1. creamos una barra, 2. creamos un boton, 3. agregamos el boton a la barra
        
        let toolbar = UIToolbar() // Para poder seleccionar la fecha del datePicker
        toolbar.sizeToFit() // Esto es para que la barra se ubique en el espacio que tenga disponible
        let doneButton = UIBarButtonItem(title: "Listo", style: .done, target: self, action: #selector(onDoneButtonPressed))
        toolbar.setItems([doneButton], animated: false) //Agregamos el boton a la barra
        
        datePicker.preferredDatePickerStyle = .wheels // Estilo de presentación
        datePicker.datePickerMode = .date
        
        birthdateTextField.inputView = datePicker
        // Ahora le anclamos la barra como entrada al textfield
        birthdateTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func onDoneButtonPressed() {
        birthdateTextField.endEditing(false)
        let birthdate = datePicker.date
        brain.processBirthdateSelected(birthdate)
        
    }
    
}

extension BirthdateViewController: BirthdateViewControllerProtocol {
    func setBirthdate(_ birthdate: String) {
        birthdateTextField.text = birthdate
    }
}
