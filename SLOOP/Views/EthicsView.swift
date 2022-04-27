//
//  EthicsView.swift
//  SLOOP
//
//  Created by Miriam Peinado on 23/4/22.
//

import SwiftUI

struct EthicsView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.linearGradient(
                    Gradient(colors: [Color("AppLightTeal"), Color("AppDarkTeal")]),
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.6)))
                .frame(width: .infinity, height: 300)
                .position(CGPoint(x:195, y: 10))
            
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color("AppDarkTeal"))
                }
                .padding()
                .background(Color("AppLightTeal"))
                .clipShape(Capsule())
                
            }
            .frame(width: 40, height: 40)
            .cornerRadius(12)
            .position(CGPoint(x:40, y: 100))
            
            
            Text("Data Privacy")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .position(CGPoint(x:200, y: 100))

            
            Text("Your sleep is unique and we want to personalize the app to help you reach your goals. To do this, we will store the data that you input and use it to suggest changes in behavior that may improve your sleep quality, based on when your tracked activity. Your data will not be shared with anyone else. We follow GDPR guidelines.")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .lineSpacing(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                .padding()
        }
    }
}

struct EthicsView_Previews: PreviewProvider {
    static var previews: some View {
        EthicsView()
    }
}
