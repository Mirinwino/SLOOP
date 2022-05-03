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
                    ZStack(alignment: .top){
                        Rectangle()
                            .fill(.linearGradient(
                                Gradient(colors: [Color("AppLightTeal"), Color("AppDarkTeal")]),
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 0.6)))
                            .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, minHeight: 200, idealHeight: 200, maxHeight: 200)
                            .edgesIgnoringSafeArea(.top)
                            
                        Text("Rakel Olesen")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                        
                    } // end ZStack top with name
                    
                    Spacer()
                    // BIRTHDAY
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
                        // APPLE HEALTH
                        HStack{
                            Image(systemName: "heart.text.square")
                                .foregroundColor(Color("AppDarkTeal"))
                            Spacer()
                            Toggle(isOn: $isOnAppleHealth) {
                                Text("Apple health Sync").fontWeight(.light)
                                    .foregroundColor(Color("AppDarkTeal"))
                            }
                        }
                        .padding()
                        .frame(width: 320, height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(Color("AppLightTeal"))
                            .shadow(radius: 2))
                        // NOTIFICATIONS
                        HStack{
                            Image(systemName: "bell.badge")
                                .foregroundColor(Color("AppDarkTeal"))
                            Spacer()
                            Toggle(isOn: $isOnNotification) {
                                Text("Notifications").fontWeight(.light)
                                    .foregroundColor(Color("AppDarkTeal"))
                            }
                        }
                        .padding()
                        .frame(width: 320, height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(Color("AppLightTeal"))
                            .shadow(radius: 2))
                        
                        // ETHICS
                        HStack{
                            Spacer()
                            NavigationLink(destination: EthicsView()) {
                                
                                Image(systemName: "doc.text")
                                    .foregroundColor(Color("AppDarkTeal"))
                                Text("About Sloop and my data")
                                    .fontWeight(.light)
                                    .foregroundColor(Color("AppDarkTeal"))
                            }
                            .padding()
                            .frame(width: 320, height: 60, alignment: .topLeading)
                        }
                        .padding()
                        .frame(width: 320, height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(Color("AppLightTeal"))
                            .shadow(radius: 2))
                        
                        
                        // DOWNLOAD MY DATA
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

                }.navigationBarTitle("")
                .padding(.bottom, 150)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
