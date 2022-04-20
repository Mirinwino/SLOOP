//
//  DrinkSquareCard.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI

struct DrinkSquare: View {
    var drink: Drink

    var body: some View {
        VStack {
            drink.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(drink.name)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
            Text(drink.name)
                .fontWeight(.medium)
                .foregroundColor(Color("AppDarkTeal"))
        }
        .padding()
        .background(Color("AppLightTeal"))
        .cornerRadius(20)
        .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("AppDarkTeal"), lineWidth: 5)
            )
    }
}


struct DrinkSquare_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkSquare(drink: drinks[0])
            DrinkSquare(drink: drinks[1])
        }
        .previewLayout(.fixed(width: 200, height: 200))
    }
    
}
