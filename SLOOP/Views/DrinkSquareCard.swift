//
//  DrinkSquareCard.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI

struct DrinkSquareCard: View {
    var drink: Drink
    static let columns = 2
    static let rows = (drinks.count + 1 + columns)/columns
    
    var body: some View {
        
        VStack {
            drink.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(drink.name)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
            Text(drink.Caffeine_mg)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
            
        }
        .padding()
        .frame(width: 131, height: 131)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color("AppLightTeal"))
            .shadow(radius: 2))
    }
}

struct DrinkSquare_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkSquareCard(drink: drinks[0])
            DrinkSquareCard(drink: drinks[1])
        }
    }
}
