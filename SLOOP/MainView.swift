//
//  MainView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      
        ForEach(ColorScheme.allCases, id: \.self) {
            MainView().preferredColorScheme($0)
        }     //MainView()
    }
}



