//
//  ContentView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(competition: Competition(id: 2021, name: "English Premier League"))
//        NavigationView{
//        Home()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
