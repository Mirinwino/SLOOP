//
//  SLOOPApp.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI
import HealthKit

@main
struct SLOOPApp: App {
    @StateObject var intakeList: IntakeList = IntakeList.instance
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(intakeList)
        }
    }
}
