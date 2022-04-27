//
//  DrinksView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI

struct DrinksView: View {
    var drinks: [Drink] = load("drinksdata.json")
    
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<DrinkSquareCard.rows){ i in
                  HStack {
                      ForEach(0..<DrinkSquareCard.columns ){ j in
                        let index = i*DrinkSquareCard.columns + j
                          
                        if (index > drinks.count) {
                            //nothing
                        }else if ( index == drinks.count ){
                            //Todo new drink
                        }else{
                            DrinkSquareCard(drink: drinks[index])
                        }
                      }
                  } .padding(.bottom, 10)
                }
            }
        }
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView()
    }
}
