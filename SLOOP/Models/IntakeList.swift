//
//  IntakeModel.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 02/05/2022.
//

import Foundation
import SwiftUI

class IntakeList: ObservableObject{
    static let instance = IntakeList()
    
    @Published var intakes: [Intake] = [] {
        didSet{
            saveItems()
        }
    }
    let intakesKey: String = "intakesList"
    private init(){
        getIntakes();
    }

    func getIntakes(){
        let newIntakes = [
            Intake(drink:
                    Drink.init(id: 11, name: "Coke Zero", Caffeine_mg: "36", Amount_ml: 330, mg_100_ml: 9.58, info: "", imageName: "CZero", imageInfo: "info_CZero"), time: getSampleDate(offset: -4)),
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
                    Drink.init(id: 2, name: "Espresso", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 212, info: " ", imageName: "espresso", imageInfo: "info_espresso"), time: getSampleDate(offset: -1)),
            
            Intake(drink:
                    Drink.init(id: 3, name: "Cappuccino", Caffeine_mg: "77", Amount_ml: 30, mg_100_ml: 104, info: " ", imageName: "cappuccino", imageInfo: "info_cappuccino"), time: getSampleDate(offset: -1))
            
          ]
        intakes.append(contentsOf: newIntakes)
        
        guard
            let data = UserDefaults.standard.data(forKey: intakesKey),
            let savedIntakes = try? JSONDecoder().decode([Intake].self, from: data)
        else {return}
        self.intakes = savedIntakes
    }
    
    func addNewIntake(drink : Drink){
        let newintake = Intake(drink: drink,time: Date.now)
        intakes.append(newintake)
    }
    //save localy
    func saveItems(){
        if let enData =  try?JSONEncoder().encode(intakes){
            UserDefaults.standard.set(enData,forKey: intakesKey)
        }
    }
    
    //add function of counting the caffeine intakes
    func getCaffeineAmount(date: Date)->Double{
        var amount = 0.0
        for i in intakes {
            if(isSameDay(date1: i.time, date2: date)){
                amount = amount + i.drink.mg_100_ml
            }
        }
        return amount
    }
    func isSameDay(date1: Date, date2: Date)->Bool{
         let calendar = Calendar.current
         return calendar.isDate(date1, inSameDayAs: date2)
    }
    
}
