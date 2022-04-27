//
//  CalendarView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//


import SwiftUI

struct CalendarView: View {
    @State private var date = Date()

    var body: some View {
        VStack {
            Text("Select a date")
                .font(.largeTitle)
            DatePicker("Date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 350)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
