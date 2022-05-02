//
//  Intake.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import Foundation
import SwiftUI

struct Intake: Identifiable {
    var id =  UUID().uuidString
    var drink: Drink
    var time: Date
}

//For static data List of intakes
struct IntakeData: Identifiable {
    var id =  UUID().uuidString
    var intake: [Intake]
    var intakeDate: Date
}


func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day,value: offset, to: Date())
    return date ?? Date()
}

