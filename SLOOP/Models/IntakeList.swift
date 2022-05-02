//
//  IntakeModel.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 02/05/2022.
//

import Foundation
import SwiftUI

class IntakeList: ObservableObject{
    
    @Published var intakes: [Intake] = []
    
    init(){
        getIntakes();
    }

    func getIntakes(){
        let newIntakes = [
            Intake(drink:
                    Drink.init(id: 11, name: "Coke Zero", Caffeine_mg: "36", Amount_ml: 330, mg_100_ml: 9.58, info: "Coca-Cola Zero Sugar is a diet cola produced by The Coca-Cola Company. In some countries, it is sold as Coca-Cola No Sugar", imageName: "CZero", imageInfo: "info_CZero"), time: getSampleDate(offset: -4)),
            Intake(drink:
                    Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"), time: getSampleDate(offset: -3)),
            
            Intake(drink:
                    Drink.init(id: 2, name: "Espresso", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 212, info: " ", imageName: "espresso", imageInfo: "info_espresso"), time: getSampleDate(offset: -2)),
            
            Intake(drink:
                    Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"), time: getSampleDate(offset: -5)),
            Intake(drink:
                    Drink.init(id: 2, name: "Espresso", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 212, info: " ", imageName: "espresso", imageInfo: "info_espresso"), time: getSampleDate(offset: -5)),
            
            Intake(drink:
                    Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"), time: getSampleDate(offset: -1)),
            Intake(drink:
                    Drink.init(id: 2, name: "Espresso", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 212, info: " ", imageName: "espresso", imageInfo: "info_espresso"), time: getSampleDate(offset: -3)),
            
            Intake(drink:
                    Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"), time: getSampleDate(offset: -1)),
            Intake(drink:
                    Drink.init(id: 11, name: "Coke Zero", Caffeine_mg: "36", Amount_ml: 330, mg_100_ml: 9.58, info: "Coca-Cola Zero Sugar is a diet cola produced by The Coca-Cola Company. In some countries, it is sold as Coca-Cola No Sugar", imageName: "CZero", imageInfo: "info_CZero"), time: getSampleDate(offset: -1))
          ]
        intakes.append(contentsOf: newIntakes)
    }
    
    func addNewIntake(drink : Drink){
        let newintake = Intake(drink: drink,time: Date.now)
        intakes.append(newintake)
    }
}
