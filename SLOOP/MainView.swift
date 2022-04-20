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
                    DrinksView()
                        .tabItem {
                            Label("Drinks", systemImage: "list.dash")
                        }

                    CalendarView()
                        .tabItem {
                            Label("Calendar", systemImage: "calendar")
                        }
                    ContentView()
                        .tabItem {
                            Label("Home", systemImage: "circle")
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
        MainView()
    }
}
