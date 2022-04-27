//
//  CalendarView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//


import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var drinks: [Drink] = load("drinksdata.json")

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                Text("Select a date")
                    .font(.headline)
                    .foregroundColor(Color("AppText"))
                
                DatePicker("Date", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 350)
                VStack{
                HStack{
                    Text("\(date.formatted(date: .long, time: .omitted))")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color("AppText"))
                    Spacer()
                }
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(0..<DrinkListComponent.rows){ i in
                            let index = i
                              
                            if (index > drinks.count) {
                                //nothing
                            }else if ( index == drinks.count ){
                                //Todo new drink
                            }else{
                                DrinkListComponent(drink: drinks[index])
                            }
                        }
                    }
                }
            }
        .padding()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        //ForEach(ColorScheme.allCases, id: \.self) {
        //    CalendarView().preferredColorScheme($0)
        //}
        CalendarView()
    }
}
