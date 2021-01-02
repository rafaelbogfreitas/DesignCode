//
//  ContentView.swift
//  DesignCode
//
//  Created by Rafael Freitas on 18/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var showCard = false
    @State var viewState = CGSize.zero
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.90)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5 ))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .onTapGesture {
                    showCard.toggle()
                }
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .gesture(
                    DragGesture()
                        .onChanged { values in
                            viewState = values.translation
                            show = true
                        }
                        .onEnded { values in
                            viewState = .zero
                            show = false
                        }
                )
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged { values in
                            bottomState = values.translation

                            if showFull {
                                bottomState.height += -300
                            }
                            
                            if bottomState.height < -300 {
                                bottomState.height = -300
                            }
                        }
                        .onEnded { _ in
                            if bottomState.height > 50 {
                                showCard = false
                            }
                            
                            if (bottomState.height < -100 && !showFull) ||
                                (bottomState.height < -250 && showFull){
                                bottomState.height = -300
                                showFull = true
                            } else {
                                bottomState = .zero
                                showFull = false
                            }

                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
            HStack {
                Spacer()
            }
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 4)
                .cornerRadius(4)
                .opacity(0.1)
            Text("This certificate is proof that Rafael Freitas has achieved the UI Design course with approval from a Design+Code instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
