//
//  BarChart.swift
//  SlOOP
//

import SwiftUI
import SwiftUICharts

struct BarChartView: View {
    
    let data : RangedBarChartData = weekOfData()
    
    var body: some View {
        RangedBarChart(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f", unit: .suffix(of: "sleep"))
            //.yAxisPOI(chartData: data,
            //          markerName: "Upper Limit",
            //          markerValue: 10,
            //          labelPosition: .center(specifier: "%.0f"),
            //          labelColour: Color.black,
            //          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
            //          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
            //          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            //.yAxisPOI(chartData: data,
                      //markerName: "Lower Limit",
                      //markerValue: 2,
                      //labelPosition: .center(specifier: "%.0f"),
                      //labelColour: Color.white,
                      //labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      //lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
             //         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .averageLine(chartData: data,
                         strokeStyle: StrokeStyle(lineWidth:0.5, dash: [2,7]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            //.infoBox(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 100, maxWidth: 750, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
            .padding(.horizontal)
            //.navigationTitle("Week of Data")
    }
    
    private var extraLineData: [ExtraLineDataPoint] {
        [ExtraLineDataPoint(value: 200),
         ExtraLineDataPoint(value: 90),
         ExtraLineDataPoint(value: 700),
         ExtraLineDataPoint(value: 175),
         ExtraLineDataPoint(value: 60),
         ExtraLineDataPoint(value: 100),
         ExtraLineDataPoint(value: 600)]
    }
    
    
    static func weekOfData() -> RangedBarChartData {
        
        let data : RangedBarDataSet =
            RangedBarDataSet(dataPoints: [
                RangedBarDataPoint(lowerValue: 0, upperValue: 8 , xAxisLabel: "Mon", description: "Monday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7 , xAxisLabel: "Tue", description: "Tuesday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 6.5 , xAxisLabel: "Wed", description: "Wednesday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7, xAxisLabel: "Thu", description: "Thursday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 9 , xAxisLabel: "Fri", description: "Friday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 8, xAxisLabel: "Sat", description: "Saturday"),
                RangedBarDataPoint(lowerValue: 0, upperValue: 7 , xAxisLabel: "Sun", description: "Sunday"),
            ],
            legendTitle: "sleep hours")
                        
        let gridStyle  = GridStyle(numberOfLines: 8,
                                   lineColour  : Color("AppDarkTeal").opacity(0.25),
                                   lineWidth   : 1)
        
        let chartStyle = BarChartStyle(infoBoxPlacement   : .infoBox(isStatic: false),
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .dataPoint(rotation: .degrees(0)),
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 6,
                                       //baseline: .minimumWithMaximum(of: 30),
                                       topLine: .maximum(of: 10))
        
        return RangedBarChartData(dataSets: data,
                                  //metadata: ChartMetadata(title: "Heart Rate", subtitle: "Over 24 Hours"),
                                  //xAxisLabels: ["00:00", "12:00", "00:00"],
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 8, bottom: 6),
                                                     colourFrom: .barStyle,
                                                     colour: ColourStyle(colours: [Color("AppDarkTeal"), Color("AppDarkTeal")],
                                                                             startPoint: .bottom, endPoint: .top)),
                                  chartStyle: chartStyle)
    }
}



struct RangedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12"], id: \.self) { deviceName in
            BarChartView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
