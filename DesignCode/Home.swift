//
//  Home.swift
//  DesignCode
//
//  Created by Rafael Freitas on 22/12/20.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        showProfile.toggle()
                    }){
                        Image("rafaelfreitas")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 30,
                    style: .continuous
                )
            )
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(
                Angle(degrees: showProfile ? -10.0 : 0),
                axis: (x: 10, y: 0, z: 0)
            )
            .shadow(
                color: Color.black.opacity(0.2),
                radius: 20,
                y: 20
            )
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(
                .spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0
                )
            )
            .edgesIgnoringSafeArea(.all)
            
            
            MenuView()
                .offset(y: showProfile ? 0 : 400)
                .animation(
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0
                    )
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
