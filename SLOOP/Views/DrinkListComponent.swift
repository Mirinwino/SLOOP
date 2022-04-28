//
//  DrinksListComponent.swift
//  SLOOP
//
//  Created by Miriam Peinado on 22/4/22.
//

import SwiftUI

struct DrinkListComponent: View {
    var intake: Intake
    
    var body: some View {
        HStack{
            intake.drink.image
                .resizable()
                .frame(width: 35, height: 35)
            VStack(alignment: .leading){
                Text(intake.drink.name)
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
                HStack{
                    Text(intake.drink.Caffeine_mg)
                        .fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                    Text("mg")
                        .fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                }
            }
            Spacer()
            Text(intake.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
        }
        .padding()
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(Color("AppDrinkCard"))
            .shadow(radius: 2))
    }
}

//struct DrinksListComponent_Previews: PreviewProvider {
//    static var previews: some View {
//     //   DrinkListComponent(intakes[1])
//    }

