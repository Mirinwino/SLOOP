//
//  CalendarView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//


import SwiftUI
import Foundation

struct CalendarView: View {
    @EnvironmentObject var intakeList: IntakeList
    @State private var date = Date()
    var drinks: [Drink] = load("drinksdata.json")

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .accentColor(Color("AppOrange"))
                .frame(maxHeight: 350)
                .background(Color("AppBackAccent"))
                .cornerRadius(12)
                
                // selected date title in HStack to be flushed left
                HStack{
                    Text("\(date.formatted(date: .long, time: .omitted))")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppText"))
                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 12){
                            //TODO make it better
                            ForEach(intakeList.intakes){ i in
                                if(isSameDay(date1: i.time, date2: date)){
                                    DrinkListComponent(intake: i)
                                }// VStack(spacing: 15){
                                    //Text("No caffeine found")
                               // }
                             }
                               
                  }
                        
                }.padding(4) //end ScrollView
            }
            .padding(.horizontal, 25)
            .padding(.vertical)
        }
    }//end ZStack for background color
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CalendarView().environmentObject(IntakeList()).preferredColorScheme($0)
        }
        //CalendarView()
    }
}
    
func isSameDay(date1: Date, date2: Date)->Bool{
     let calendar = Calendar.current
      
    return calendar.isDate(date1, inSameDayAs: date2)
    
}

