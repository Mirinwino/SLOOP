//
//  Sleep.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 06/05/2022.
//

import Foundation
import SwiftUI

struct Sleep: Identifiable, Hashable, Codable {
    var id =  UUID().uuidString
    var totalSleepTime: TimeInterval
    var fallAsleepTime: Date
    var wakeUpTime: Date
    
}

