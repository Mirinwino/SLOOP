//
//  DrinksListComponent.swift
//  SLOOP
//
//  Created by Miriam Peinado on 22/4/22.
//

import SwiftUI

struct DrinkListComponent: View {
    var drink: Drink
    static let rows = (drinks.count)
    
    var body: some View {
        HStack{
            drink.image
                .resizable()
                .frame(width: 35, height: 35)
            VStack(alignment: .leading){
                Text(drink.name)
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
                HStack{
                    Text(drink.Caffeine_mg)
                        .fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                    Text("mg")
                        .fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                }
            }
            Spacer()
            Text("Time")
                .fontWeight(.light)
                .foregroundColor(Color("AppDarkTeal"))
        }
        .padding()
        .frame(width: 320, height: 60)
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(Color("AppDrinkCard"))
            .shadow(radius: 2))
    }
}

struct DrinksListComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkListComponent(drink: drinks[0])
            DrinkListComponent(drink: drinks[1])
        }
    }
}
