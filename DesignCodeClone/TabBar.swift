//
//  TabBar.swift
//  DesignCodeClone
//
//  Created by mohammad yasir on 14/11/20.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
