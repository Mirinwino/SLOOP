//
//  ContentView.swift
//  SLOOP
//
//  Created by Miriam Peinado on 20/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            
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
            
            HStack{
                Text("Left arrow")
                Spacer()
                Text("Week date")
                Spacer()
                Text("Right arrow")
            }.padding()
            
            VStack{
            BarChartView()
            BarChartCoffee()
            }.padding()

            VStack{
                HStack{
                    Image(systemName: "powersleep")
                        .foregroundColor(Color("AppDarkTeal"))
                    ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    Text("1/3")
                }.padding(.horizontal, 30.0)
                HStack{
                    Image(systemName: "cup.and.saucer.fill")
                        .foregroundColor(Color("AppDarkTeal"))
                    ProgressView(value: 0.5)
                        .foregroundColor(Color("AppDarkTeal"))
                    Text("1/3")
                }.padding(.horizontal, 30.0)
                HStack{
                    Image(systemName: "bolt.fill")
                        .foregroundColor(Color("AppDarkTeal"))
                    ProgressView(value: 0.5)
                    Text("1/3")
                }.padding(.horizontal, 30.0)
            }
            
            HStack{
                Spacer()
                Button("Add intake") {
                
                }
                .padding(.vertical, 10)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.title)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("AppDarkTeal"), Color("AppDarkTeal").opacity(0.90)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                Spacer()
            }.padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
