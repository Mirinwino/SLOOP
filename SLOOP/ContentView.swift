//
//  ContentView.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//
import Foundation

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                // Logo + welcome
                HStack{
                    Spacer()
                    Image("IconNoBackground")
                        .resizable()
                        .frame(width: 65, height: 60)
                    Spacer()
                    Text("Welcome to SLOOP")
                        .foregroundColor(Color("AppDarkTeal"))
                        .padding()
                    Spacer()
                }

                // Week date top bar
                HStack{
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Color("AppDarkTeal"))
                        }
                        .padding()
                        .background(Color("AppLightTeal"))
                        .clipShape(Capsule())
                        
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    Text("Week")
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color("AppDarkTeal"))
                        }
                        .padding()
                        .background(Color("AppLightTeal"))
                        .clipShape(Capsule())
                        
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(12)
                }

                // Bar plots
                VStack{
                    BarChartSleep()
                    BarChartCoffee()
                }.padding()
                
                // input of new drinks
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top){
                        ForEach(0..<RoundDrinks.num){ i in
                            if (i > drinks.count) {
                                //nothing
                            }else if ( i == drinks.count ){
                                //Todo new drink
                            }else{
                                RoundDrinks(drink: drinks[i])
                                
                            }
                        }.padding([.top, .leading, .trailing], 4.0)
                    }
                }
                // goals
                HStack{
                    Spacer()
                    BarHorizontalGoals().padding()
                    Spacer()
                }
                
                //HStack{
                //    Spacer()
                //    Button("Add intake") {
                //
                //    }
                //    .padding(.vertical, 10)
                //    .frame(minWidth: 0, maxWidth: .infinity)
                //    .font(.title)
                //    .foregroundColor(Color.white)
                //    .background(LinearGradient(gradient: Gradient(colors: [Color("AppDarkTeal"), Color("AppDarkTeal").opacity(0.90)]), startPoint: .leading, endPoint: .trailing))
                //    .cornerRadius(12)
                //    Spacer()
                // }.padding()
            }
            .padding()
        }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    
    }
}
