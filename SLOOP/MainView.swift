//
//  MainView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI
import HealthKit


struct MainView: View {
    let store = HKHealthStore()
    @State var isReady = false
    
    var body: some View {
        VStack {
            if isReady {
        
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "cup.and.saucer")
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                DrinksView()
                    .tabItem {
                        Label("Drinks", systemImage: "list.dash")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                }
            }
        }
        .task {
            if !HKHealthStore.isHealthDataAvailable() {
                return
            }

            guard await requestPermission() == true else {
                return
            }

            isReady = true
        }
    }
     
    
    func requestPermission () async -> Bool {
        //let write: Set<HKSampleType> = [.workoutType()]
        let read: Set<HKSampleType> = [.categoryType(forIdentifier: .sleepAnalysis)!]

        let res: ()? = try? await store.requestAuthorization(toShare: read, read: read)
        guard res != nil else {
            return false
        }

        return true
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
//            MainView().preferredColorScheme($0)
//        }
        MainView()
    }
}



