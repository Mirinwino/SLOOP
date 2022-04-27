//
//  BarChart.swift
//  SlOOP
//

import SwiftUI
import SwiftUICharts

struct BarChartSleep: View {
    
    let data : RangedBarChartData = weekOfData()
    
    var body: some View {
        VStack{
            HStack{
                Text("Sleep (hours)")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()
            }.padding(.bottom, 5)
            
            RangedBarChart(chartData: data)
    //            .touchOverlay(chartData: data, specifier: "%.0f", unit: .suffix(of: "sleep"))
            
    //            .averageLine(chartData: data,
    //                         strokeStyle: StrokeStyle(lineWidth:0.5, dash: [2,7]))
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
    //            .infoBox(chartData: data)
    //            .headerBox(chartData: data)
    //            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 130, idealHeight: 130, maxHeight: 130, alignment: .center)
        } // end VStack
    } // end View
    
    static func weekOfData() -> RangedBarChartData {
        
        let data : RangedBarDataSet =
            RangedBarDataSet(dataPoints: [
                RangedBarDataPoint(lowerValue: 0, upperValue: 8   , xAxisLabel: "Mon"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Tue"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 6.5 , xAxisLabel: "Wed"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Thu"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 9   , xAxisLabel: "Fri"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 8   , xAxisLabel: "Sat"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7   , xAxisLabel: "Sun"),
            ],
            legendTitle: "sleep hours")
                        
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
