//
//  BirthDateFormatter.swift
//  PestanyasYDelegados
//
//  Created by TEO on 28/12/22.
//

import Foundation

class BirthDateFormatter {
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = . medium
        return dateFormatter
    }()
    
    func convert(date: Date) -> String {
        dateFormatter.string(from: date)  
    }
}
