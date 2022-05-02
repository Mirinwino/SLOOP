//
//  BarChartCoffee.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI
import SwiftUICharts

struct BarChartCoffee: View {
    
    let data : RangedBarChartData = weekOfData()
    
    var body: some View {
        VStack{
            HStack{
                Text("Caffeine intate (mg)")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppOrange"))
                Spacer()
            }.padding(.bottom, 5)

            RangedBarChart(chartData: data)
//                .touchOverlay(chartData: data, specifier: "%.0f", unit: .suffix(of: "sleep"))
//                .averageLine(chartData: data,
//                             strokeStyle: StrokeStyle(lineWidth:0.5, dash: [2,5]))
                
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
            
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
            
//                .infoBox(chartData: data)
//                .headerBox(chartData: data)
                
    //            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 130, idealHeight: 130, maxHeight: 130, alignment: .center)
                //.navigationTitle("Week of Data")
        } // end VStack
    } // end View
    

    static func weekOfData() -> RangedBarChartData {
        let data : RangedBarDataSet =
            RangedBarDataSet(
                dataPoints: [
                    RangedBarDataPoint(lowerValue: 0, upperValue: 10 , xAxisLabel: "Mon"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  7 , xAxisLabel: "Tue"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  2 , xAxisLabel: "Wed"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  8 , xAxisLabel: "Thu"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  3 , xAxisLabel: "Fri"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  3 , xAxisLabel: "Sat"),
                    RangedBarDataPoint(lowerValue: 0, upperValue:  5 , xAxisLabel: "Sun")
                ],
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
                .environmentObject(IntakeList())
        }
        //.previewLayout(.fixed(width: 350, height: 500))
    }
}
