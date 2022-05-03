//
//  BarHorizontalGoals.swift
//  SLOOP
//
//  Created by Miriam Peinado on 1/5/22.
//

import SwiftUI



/// SwiftUI view that draws bars by placing them into a vertical container.
public struct BarHorizontalGoals: View {
//    let dataPoints: [DataPoint]
    //let barMaxWidth: CGFloat
    

    /**
     Creates new horizontal bar chart with the following parameters.

     - Parameters:
        - dataPoints: The array of data points that will be used to draw the bar chart.
        - barMaxWidth: The maximal width for the bar that presents the biggest value. Default is 100.
     */
//    public init(dataPoints: [DataPoint], barMaxWidth: CGFloat = 100) {
//        self.dataPoints = dataPoints
//        self.barMaxWidth = barMaxWidth
//    }
//
//    private var max: Double {
//        guard let max = dataPoints.max()?.endValue, max != 0 else {
//            return 1
//        }
//        return max
//    }

//    let Sleep,SleepMax,NumDrink, NumDrinkMax, Caffeine, CaffeineMax: Double
//
//    Sleep = 6
//    SleepMax = 8
//    private var Sleep100: Double{
//        return Sleep/100*SleepMax
//    }
//
//    var NumDrink = 6
//    var NumDrinkMax = 8
//
//    var Caffeine = 6
//    var CaffeineMax = 8
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            //ForEach(dataPoints, id: \.self) { bar in
            
            // Goal 1: sleep
            HStack {
                    Image(systemName: "powersleep")
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color("AppDarkTeal"))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color("AppDrinkCard")))
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .foregroundColor(Color("AppDarkTeal"))
                        .frame(width: ((8*100)/8)*2.1, height: 16)
                    
                    
                    
                Text(String((8*100)/8)).foregroundColor(Color("AppDarkTeal")) + Text("%").foregroundColor(Color("AppDarkTeal"))
                    

                }
            // Goal 2: coffe number
            HStack {
                Image(systemName: "cup.and.saucer.fill")
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color("AppDarkTeal"))
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color("AppDrinkCard")))
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(Color("AppDarkTeal"))
                    .frame(width: ((1*100)/4)*2.1, height: 16)
                
                
                
                Text(String((1*100)/4)).foregroundColor(Color("AppDarkTeal")) + Text("%").foregroundColor(Color("AppDarkTeal"))

            }
            // Goal 3: caffeine mg
            HStack {
                Image(systemName: "bolt.fill")
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color("AppDarkTeal"))
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color("AppDrinkCard")))
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(Color("AppDarkTeal"))
                    .frame(width: ((70*100)/200)*2.1, height: 16)
                
            
                
                Text(String((70*100)/200)).foregroundColor(Color("AppDarkTeal")) + Text("%").foregroundColor(Color("AppDarkTeal"))

            }
            //} //end ForEach
        }
    }
}

struct BarHorizontalGoals_Previews: PreviewProvider {
    static var previews: some View {
//        let goal1 = Legend(color: Color("AppDarkTeal"), label: "powersleep")
//        let goal2 = Legend(color: Color("AppDarkTeal"), label: "cup.and.saucer.fill")
//        let goal3 = Legend(color: Color("AppDarkTeal"), label: "bolt.fill")
//
//
//        let dataPoints: [DataPoint] = [
//            DataPoint(value: 0.1, label: "10%", legend: goal1),
//            DataPoint(value: 0.15, label: "15%", legend: goal2),
//            DataPoint(value: 0.60, label: "60%", legend: goal3)
//        ]

        //return BarHorizontalGoals(dataPoints: dataPoints)
        return BarHorizontalGoals()
    }
}
