//
//  TabBar.swift
//  DesignCode
//
//  Created by Rafael Freitas on 02/01/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                HStack {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
