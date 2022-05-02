//
//  DrinksView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI

struct DrinksView: View {
    var drinks: [Drink] = load("drinksdata.json")
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
            //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 103/255, green: 143/255, blue: 158/255, alpha: 1.0)]

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(red: 103/255, green: 143/255, blue: 158/255, alpha: 1.0)]
        }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("AppBackground")
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<DrinkSquareCard.rows){ i in
                        LazyHStack(spacing: 22){
                          ForEach(0..<DrinkSquareCard.columns ){ j in
                            let index = i*DrinkSquareCard.columns + j
                              
                            if (index > drinks.count) {
                                //nothing
                            }else if ( index == drinks.count ){
                                //Todo new drink
                            }else{
                                NavigationLink(destination: DinkInfoView(drink: drinks[index])) {
                                    DrinkSquareCard(drink: drinks[index])
                                }
                            }
                          }
                      }
                      .padding(10)
                    }
                }
            }
            .navigationBarTitle("Know more about your drinks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView().environmentObject(IntakeList())
    }
}
