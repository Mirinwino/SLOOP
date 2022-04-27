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
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 110)
            HStack{
                Text(drink.Caffeine_mg)
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
                Text("mg")
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
            }
            
        }
        .padding()
        .frame(width: 130.0, height: 130.0)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color("AppDrinkCard"))
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
