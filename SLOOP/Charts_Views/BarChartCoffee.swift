//
//  BarChartCoffee.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI
import SwiftUICharts
//
//TODO: A COUNTER OF INTAKES PER DAY to display the caffeine actouly the amount of caffeine
struct BarChartCoffee: View {
    @EnvironmentObject var intakeList: IntakeList
   // var data : RangedBarChartData = weekOfData()
    
    var body: some View {
        VStack{
            HStack{
                Text("Caffeine intate (mg)")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppOrange"))
                Spacer()
            }.padding(.bottom, 5)
            //TODO introduce data var for BarChartCoffee.weekOfData()
            RangedBarChart(chartData: BarChartCoffee.weekOfData())
//                .touchOverlay(chartData: data, specifier: "%.0f", unit: .suffix(of: "sleep"))
//                .averageLine(chartData: data,
//                             strokeStyle: StrokeStyle(lineWidth:0.5, dash: [2,5]))
                
                .xAxisGrid(chartData: BarChartCoffee.weekOfData())
                .yAxisGrid(chartData: BarChartCoffee.weekOfData())
            
                .xAxisLabels(chartData: BarChartCoffee.weekOfData())
                .yAxisLabels(chartData: BarChartCoffee.weekOfData())
            
//                .infoBox(chartData: data)
//                .headerBox(chartData: data)
                
    //            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(BarChartCoffee.weekOfData().id)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 130, idealHeight: 130, maxHeight: 130, alignment: .center)
                //.navigationTitle("Week of Data")
        } // end VStack
    } // end View
    
    
   static func weekOfData() -> RangedBarChartData {
       //Todo: find today, list with timedates, lista points
       
       // frist is sunday
       let day_names = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri" ,"Sat"]

       // get the weekday from 1 to 7 and we -1 to make it zero based
       let firstday = Calendar.current.component(Calendar.Component.weekday, from: Date.now) - 1

       // collect all the datapoints
       var datapoints: [RangedBarDataPoint] = []

       for i in -6...0 {
           let day = Calendar.current.date(
               byAdding: Calendar.Component.day, value: i,  // add i*days
               to: Date.now)

           datapoints.append(
               RangedBarDataPoint(
                   lowerValue: 0,
                   upperValue:  IntakeList.instance.getCaffeineAmount(date: day!),
                   xAxisLabel: day_names[  (firstday + i + 7) % 7  ]
               )
           )


       }
        let data : RangedBarDataSet =
            RangedBarDataSet(
                dataPoints: datapoints,
                legendTitle: "caffeine intake")
        
        
                        
        let xgridStyle  = GridStyle(numberOfLines: 8,
                                   lineColour  : Color("AppDarkTeal").opacity(0.25),
                                   lineWidth   : 1)
        let ygridStyle  = GridStyle(numberOfLines: 5,
                                   lineColour  : Color("AppDarkTeal").opacity(0.25),
                                   lineWidth   : 1)
        
        let chartStyle = BarChartStyle(//infoBoxPlacement   : .infoBox(isStatic: false),
                                       xAxisGridStyle     : xgridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .dataPoint(rotation: .degrees(0)),
                                       yAxisGridStyle     : ygridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 6
                                       //baseline: .minimumWithMaximum(of: 10),
                                       //topLine: .maximum(of: 10)
        )//end chartStyle
        
        return RangedBarChartData(dataSets: data,
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 8, bottom: 6),
                                                     colourFrom: .barStyle,
                                                     colour: ColourStyle(colours: [Color("AppDarkOrange"), Color("AppOrange")],
                                                                         startPoint: .bottom, endPoint: .top)),
                                  chartStyle: chartStyle)
    }
}


struct BarChartCoffee_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13","iPhone SE (2nd generation)" ], id: \.self) { deviceName in
            BarChartCoffee()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        //.previewLayout(.fixed(width: 350, height: 500))
    }
}
