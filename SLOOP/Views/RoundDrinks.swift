//
//  RoundDrinks.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import SwiftUI

struct RoundDrinks: View {
    var drink: Drink
    static let num = (drinks.count)
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                drink.image
                    .resizable()
                    .frame(width: 30, height: 30)
                    .frame(width: 55, height: 55)
                    .background(RoundedRectangle(cornerRadius: 50)
                        .fill(Color("AppDrinkCard"))
                        .shadow(radius: 2))
                
                Text(drink.name)
                    .font(.footnote)
                    .fontWeight(.thin)
                    .foregroundColor(Color("AppDarkTeal"))
                    .multilineTextAlignment(.center)
                    .frame(width: 55)
                    
                }
            Text("+")
                .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(Color("AppLightTeal"))
                .multilineTextAlignment(.center)
                .frame(width: 60.0)
                .frame(width: 18, height: 18)
                .background(RoundedRectangle(cornerRadius: 50)
                    .fill(Color("AppOrange"))
                    .shadow(radius: 2))
                .offset(x:0, y:43)
        }
    }
}

struct RoundDrinks_Previews: PreviewProvider {
    static var previews: some View {
        RoundDrinks(drink: drinks[0])
    }
}
