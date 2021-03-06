//
//  RoundDrinks.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import SwiftUI

struct RoundDrinks: View {
    @State private var showingAlert = false
    var drink: Drink
    static let num = (drinks.count)
    
    var body: some View {
        ZStack(alignment: .center){
            
            Button (action: {
                showingAlert = true
                }) {
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
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AppLightTeal"))
                        .frame(width: 18, height: 18)
                        .background(RoundedRectangle(cornerRadius: 50)
                            .fill(Color("AppOrange"))
                            .shadow(radius: 2))
                        .offset(x:-22, y:0)
                        .padding(.trailing, -25.0)

                } .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to add " + drink.name + " ?"),
                        
                        primaryButton: .destructive(Text("Cancel")),
                        
                        secondaryButton: .default(Text("Yes")) {
                            IntakeList.instance.addNewIntake(drink: drink)
                        }
                    )
                }
           
        }
    }
   
}


struct RoundDrinks_Previews: PreviewProvider {
    static var previews: some View {
        RoundDrinks(drink: drinks[0])
    }
}
