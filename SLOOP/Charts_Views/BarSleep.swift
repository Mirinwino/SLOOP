//
//  BarSleep.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import Foundation
import SwiftUI

struct BarSleep: View {
  var datum: Double
  var colors: [Color]

  var gradient: LinearGradient {
    LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
  }

  var body: some View {
    Rectangle()
      .fill(gradient)
      .opacity(datum == 0.0 ? 0.0 : 1.0)
  }
}
