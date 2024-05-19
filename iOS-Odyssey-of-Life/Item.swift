//
//  Item.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 19/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
