//
//  HomeView.swift
//  DesignCode
//
//  Created by Rafael Freitas on 23/12/20.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {showUpdate.toggle()} , label: {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                })
            }
            .sheet(isPresented: $showUpdate){
                UpdateList()
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), color2: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), width: 44, height: 44, percent: 43, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Watched 10 minutes today")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Double(
                                            geometry.frame(in: .global).minX - 30
                                        ) / -20
                                    ),
                                    axis: (
                                        x: 0,
                                        y: 10.0,
                                        z: 0
                                    )
                                )
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 20)
            })
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}


struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(
            color: section.color.opacity(0.3),
            radius: 20,
            x: 0,
            y: 20
        )
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 sections",
        logo: "Logo1",
        image: Image("Card1"),
        color: Color("card1")
    ),
    Section(
        title: "Build a SwiftUI app",
        text: "20 sections",
        logo: "Logo1",
        image: Image("Card2"),
        color: Color("card2")
    ),
    Section(
        title: "SwiftUI advanced",
        text: "20 sections",
        logo: "Logo1",
        image: Image("Card3"),
        color: Color("card3")
    )
]
