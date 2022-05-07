//
//  SleepData.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 06/05/2022.
//


import HealthKit
import Foundation

class SleepData: ObservableObject {
    
    static let instance = SleepData()
    
    @Published var sleep: [Sleep] = []
    

    private init(){
        readSleep(from: Calendar.current.date(byAdding: .day,value: -7, to: Date()), to: Date.now);
      //  print("DATE BEFORE \(Calendar.current.date(byAdding: .day,value: -6, to: Date()) )")
    }

    func getSleepAmount(date: Date)->Double{
        var amount = 0.0
       for i in sleep {
           if(isSameDay(date1: i.wakeUpTime, date2: date)){
              amount = amount + i.totalSleepTime
            }
       }
        return amount
    }
        
        
//read sleep data from health app
func readSleep(from startDate: Date?, to endDate: Date?) {
    
    let healthStore = HKHealthStore()
    
    // first, we define the object type we want
    guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
        return
    }
    
    // we create a predicate to filter our data
    let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

    // I had a sortDescriptor to get the recent data first
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)

    // we create our query with a block completion to execute
    let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: 30, sortDescriptors: [sortDescriptor]) { (query, result, error) in
        if error != nil {
            // handle error
            return
        }
        
        if let result = result {
            // do something with those data
            result
                .compactMap({ $0 as? HKCategorySample })
                .forEach({ sample in
                    guard let sleepValue = HKCategoryValueSleepAnalysis(rawValue: sample.value) else {
                        return
                    }
                    
                    //let isAsleep = sleepValue == .asleep
                    let sleepSecods = sample.endDate.timeIntervalSince(sample.startDate)
                    let hours = sleepSecods / (60*60)
                    
                    let newSleep = Sleep(totalSleepTime: hours,fallAsleepTime: sample.startDate, wakeUpTime: sample.endDate)
                    self.sleep.append(newSleep)
                    
                    print("HealthKit sleep \(self.sleep) ")
                })
        }
    }

    // finally, we execute our query
    healthStore.execute(query)
}

}

