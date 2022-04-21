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
                .frame(width: 40, height: 40)
            Text(drink.name)
                .fontWeight(.medium)
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
        .padding()
        .frame(width: 125, height: 125)
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color("AppLightTeal"))
            .shadow(radius: 2))
    }
}


struct DrinkSquare_Previews: PreviewProvider {
  
    static var previews: some View {
            Group {
                DrinkSquare(drink: drinks[0])
                DrinkSquare(drink: drinks[1])
            }
//            .previewLayout(.fixed(width: 200, height: 200))
               
        
    }
    
}
