//
//  BarChart.swift
//  SlOOP
//

import SwiftUI
import SwiftUICharts
import HealthKit

struct BarChartSleep: View {
    @EnvironmentObject var sleepList: SleepData

   //let healthStore = HKHealthStore()
   // let data : RangedBarChartData = weekOfData()
    
    var body: some View {
        VStack{
            HStack{
                Text("Sleep (hours)")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()
            }.padding(.bottom, 5)
            
            RangedBarChart(chartData: BarChartSleep.weekOfData())
                .xAxisGrid(chartData: BarChartSleep.weekOfData())
                .yAxisGrid(chartData: BarChartSleep.weekOfData())
                .xAxisLabels(chartData: BarChartSleep.weekOfData())
                .yAxisLabels(chartData: BarChartSleep.weekOfData())
                .id(BarChartSleep.weekOfData().id)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 130, idealHeight: 130, maxHeight: 130, alignment: .center)
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
                    upperValue: Double(SleepData.instance.getSleepAmount(date: day!)),
                    xAxisLabel: day_names[  (firstday + i + 7) % 7  ]
                )
            )

        }
        let data : RangedBarDataSet =
            RangedBarDataSet(
                dataPoints: datapoints,
                legendTitle: "sleep hours")
        
//    static func weekOfData() -> RangedBarChartData {
//        
//        let data : RangedBarDataSet =
//            RangedBarDataSet(dataPoints: [
//                RangedBarDataPoint(lowerValue: 0, upperValue: 8   , xAxisLabel: "Mon"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Tue"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 6.5 , xAxisLabel: "Wed"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Thu"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 9   , xAxisLabel: "Fri"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 8   , xAxisLabel: "Sat"),
//                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Sun"),
//            ],
//            legendTitle: "sleep hours")
                        
        let xgridStyle  = GridStyle(numberOfLines: 8,
                                   lineColour  : Color("AppDarkTeal").opacity(0.25),
                                   lineWidth   : 1)
        let ygridStyle  = GridStyle(numberOfLines: 5,
                                   lineColour  : Color("AppDarkTeal").opacity(0.25),
                                   lineWidth   : 1)
        
        let chartStyle = BarChartStyle(infoBoxPlacement   : .infoBox(isStatic: false),
                                       xAxisGridStyle     : xgridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .dataPoint(rotation: .degrees(0)),
                                       yAxisGridStyle     : ygridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 6,
                                       //baseline: .minimumWithMaximum(of: 30),
                                       topLine: .maximum(of: 10))
        
        return RangedBarChartData(dataSets: data,
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 8, bottom: 6),
                                                     colourFrom: .barStyle,
                                                     colour: ColourStyle(colours: [Color("AppVeryDarkTeal"), Color("AppDarkTeal")],
                                                                             startPoint: .bottom, endPoint: .top)),
                                  chartStyle: chartStyle)
    }
    
}



struct RangedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12"], id: \.self) { deviceName in
            BarChartSleep()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
