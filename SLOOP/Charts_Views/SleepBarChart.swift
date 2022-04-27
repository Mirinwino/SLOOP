//
//  SleepBarChart.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import SwiftUI

struct SleepBarChart: View {
  var data: [Double]
  var colors: [Color]

  var highestData: Double {
    let max = data.max() ?? 1.0
    if max == 0 { return 1.0 }
    return max
  }

  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .bottom, spacing: 2.0) {
        ForEach(data.indices, id: \.self) { index in
          let width = (geometry.size.width / CGFloat(data.count)) - 4.0
          let height = geometry.size.height * data[index] / highestData

          BarSleep(datum: data[index], colors: colors)
            .frame(width: width, height: height, alignment: .bottom)
        }
      }
    }
  }
}

//struct SleepBarChart_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepBarChart()
//    }
//}





