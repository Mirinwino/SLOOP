//
//  ProfileView.swift
//  SLOOP
//
//  Created by Anastasia Sarlova on 20/04/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var navigationIsShowing = false
    @State private var isOnNotification = false
    @State private var isOnAppleHealth = false

    var body: some View {
        NavigationView{
            ZStack {
                Color("AppBackground")
                    .ignoresSafeArea()
                VStack{
                    ZStack(alignment: .center){
                        Rectangle()
                            .fill(.linearGradient(
                                Gradient(colors: [Color("AppLightTeal"), Color("AppDarkTeal")]),
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 0.6)))
                            .edgesIgnoringSafeArea(.top)
                            //.frame(height: 200)
                            .frame(minWidth: 300, idealWidth: 300, maxWidth: 600, minHeight: 200, idealHeight: 200, maxHeight: 200)
                        Text("Ema Watson")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
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
                            Toggle(isOn: $isOnAppleHealth) {
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
                        Toggle(isOn: $isOnNotification) {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Notifications")/*@END_MENU_TOKEN@*/.fontWeight(.light)
                                .foregroundColor(Color("AppDarkTeal"))
                        }
                    }
                    .padding()
                    .frame(width: 320, height: 60)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color("AppLightTeal"))
                        .shadow(radius: 2))


                    HStack{
                            Spacer()
                            NavigationLink(destination: EthicsView()) {
                                
                                Image(systemName: "doc.text")
                                    .foregroundColor(Color("AppDarkTeal"))
                                Text("About Sloop and my data")
                                    .fontWeight(.light)
                                    .foregroundColor(Color("AppDarkTeal"))
                            }.padding()
                             .frame(width: 320, height: 60, alignment: .topLeading)
                          
                                    
                        }
                        .padding()
                        .frame(width: 320, height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color("AppLightTeal"))
                        .shadow(radius: 2))
                       
                            
                        
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
                Spacer()
                Spacer()
                Spacer()
            }.navigationBarTitle("Profile")
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
