//
//  readsleep.swift
//  SLOOP
//
//  Created by Miriam Peinado on 4/5/22.
//

import Foundation
import HealthKit

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
                    
                    let isAsleep = sleepValue == .asleep
                    
                    print("HealthKit sleep \(sample.startDate) \(sample.endDate) - source \(sample.sourceRevision.source.name) - isAsleep \(isAsleep)")
                })
        }
    }

    // finally, we execute our query
    healthStore.execute(query)
}



