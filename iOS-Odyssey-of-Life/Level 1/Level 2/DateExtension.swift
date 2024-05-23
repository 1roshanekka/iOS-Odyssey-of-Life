//
//  DateExtension.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 22/05/24.
//

import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
