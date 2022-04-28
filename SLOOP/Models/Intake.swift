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
    var time: Date = Date()
}

//List of intakes
struct IntakeData: Identifiable{
    var id =  UUID().uuidString
    var intake: [Intake]
    var intakeDate: Date
}

func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day,value: offset, to: Date())
    return date ?? Date()
}

//added fake data Add here more to see them in the calendar

var intakes: [IntakeData] =  [
    
    IntakeData(intake:[
        
        Intake(drink:
                Drink.init(id: 11, name: "Coke Zero", Caffeine_mg: "36", Amount_ml: 330, mg_100_ml: 9.58, info: "Coca-Cola Zero Sugar is a diet cola produced by The Coca-Cola Company. In some countries, it is sold as Coca-Cola No Sugar", imageName: "CZero", imageInfo: "info_CZero")),
        Intake(drink:
                Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"))
    ], intakeDate: getSampleDate(offset: 0)),
               
    IntakeData(intake:[
                   
        Intake(drink:
                Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"))
                          ], intakeDate: getSampleDate(offset: -3)),
    
    IntakeData(intake:[
                   
        Intake(drink:
                Drink.init(id: 2, name: "Espresso", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 212, info: " ", imageName: "espresso", imageInfo: "info_espresso")),
        
        Intake(drink:
                Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"))
        
                          ], intakeDate: getSampleDate(offset: -8)),
    
    IntakeData(intake:[
     
        Intake(drink:
                Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"))
        
                          ], intakeDate: getSampleDate(offset: -14))
      
]

