//
//  ProfileView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var navigationIsShowing = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.linearGradient(
                    Gradient(colors: [Color("AppLightTeal"), Color("AppDarkTeal")]),
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.6)))
                .frame(width: .infinity, height: 300)
                .position(CGPoint(x:195, y: 10))
            
            Text("Ema Watson")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .position(CGPoint(x:195, y: 100))
            
        VStack(spacing: 12){
            HStack{
                Image(systemName: "person")
                    .foregroundColor(Color("AppDarkTeal"))
                Text("Birthday")
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()
                Text("01/01/1990")
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
            }
            .padding()
            .frame(width: 320, height: 60)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color("AppLightTeal"))
                .shadow(radius: 2))
            
            HStack{
                Image(systemName: "heart.text.square")
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Apple health Sync")/*@END_MENU_TOKEN@*/.fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                }
            }
            .padding()
            .frame(width: 320, height: 60)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color("AppLightTeal"))
                .shadow(radius: 2))
            
            HStack{
                Image(systemName: "bell.badge")
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Notifications")/*@END_MENU_TOKEN@*/.fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                }
            }
            .padding()
            .frame(width: 320, height: 60)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color("AppLightTeal"))
                .shadow(radius: 2))


            Button(action: {}) {
                HStack{
                    Image(systemName: "doc.text")
                        .foregroundColor(Color("AppDarkTeal"))
                    Text("About Sloop and my data")
                        .fontWeight(.light)
                        .foregroundColor(Color("AppDarkTeal"))
                    Spacer()

                }
                .padding()
                .frame(width: 320, height: 60)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color("AppLightTeal"))
                    .shadow(radius: 2))
                    
                }
            
            HStack{
                Image(systemName: "arrow.down.doc")
                    .foregroundColor(Color("AppDarkTeal"))
                Text("Download my data")
                    .fontWeight(.light)
                    .foregroundColor(Color("AppDarkTeal"))
                Spacer()

            }
            .padding()
            .frame(width: 320, height: 60)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color("AppLightTeal"))
                .shadow(radius: 2))
        }
    }
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



