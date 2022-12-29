//
//  BirthdateBrain.swift
//  PestanyasYDelegados
//
//  Created by TEO on 28/12/22.
//

import Foundation

protocol BirthdateBrainProtocol {
    func setViewController(_ viewController: BirthdateViewControllerProtocol)
    func processBirthdateSelected(_ birthdate: Date)
}

class BirthdateBrain {
    weak var viewController: BirthdateViewControllerProtocol?
    let birthdateFormatter = BirthDateFormatter()
}

extension BirthdateBrain: BirthdateBrainProtocol {
    func setViewController(_ viewController: BirthdateViewControllerProtocol) {
        self.viewController = viewController
    }

    func processBirthdateSelected(_ birthdate: Date) {
        let birthdateString = birthdateFormatter.convert(date: birthdate)
        
        guard let viewController = viewController else { return }
        viewController.setBirthdate(birthdateString)
    }
}
