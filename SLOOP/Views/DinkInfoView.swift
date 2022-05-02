//
//  DinkInfoView.swift
//  SLOOP
//
//  Created by Miriam Peinado on 27/4/22.
//

import SwiftUI

struct DinkInfoView: View {
    var drink: Drink
    
    var body: some View {
        ZStack(alignment: .top){
            Color("AppBackground")
                .ignoresSafeArea()
            drink.imageInfoView
                .resizable()
                .frame(width: 400, height: 300)
                .ignoresSafeArea()
        
            VStack(alignment: .leading){
                HStack(alignment: .bottom){
                    drink.image
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(drink.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AppDarkTeal"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.vertical, 15)
                Text(drink.info)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("AppText"))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15.0 )
                Spacer()
            }
            .offset(y: 200)
            .padding(20)
        }.navigationTitle(". ")
    }
}

struct DinkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DinkInfoView(drink: drinks[0]).environmentObject(IntakeList())
    }
}
