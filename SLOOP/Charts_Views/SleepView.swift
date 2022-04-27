//
//  SleepView.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import SwiftUI

struct SleepView: View {
  @State private var moveValues: [Double] = SleepView.mockData(24, in: 0...300)
  @State private var exerciseValues: [Double] = SleepView.mockData(24, in: 0...60)
  @State private var standValues: [Double] = SleepView.mockData(24, in: 0...1)

  var body: some View {
    VStack(alignment: .leading) {
      Text("Move").bold()
        .foregroundColor(.red)

        SleepBarChart(data: moveValues, colors: [.red, .orange])

      Text("Exercise").bold()
        .foregroundColor(.green)

        SleepBarChart(data: exerciseValues, colors: [.green, .yellow])

      Text("Stand").bold()
        .foregroundColor(.blue)

        SleepBarChart(data: standValues, colors: [.blue, .purple])
    }
    .padding()
  }

  static func mockData(_ count: Int, in range: ClosedRange<Double>) -> [Double] {
    (0..<count).map { _ in .random(in: range) }
  }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}



