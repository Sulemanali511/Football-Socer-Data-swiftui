//
//  MainView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct MainView: View {
    let competition: Competition

    
    var body: some View {
        TabView {
            NavigationView {
                StandingView(competition: self.competition)
                    
            }
        
        
            .tabItem {
                Image(systemName: "table.fill")
                Text("Standings")
            }
            .tag(0)
            
            
            NavigationView {
                MatchListView(competition: competition, type: .latest)
                    .navigationBarTitle("Latest")
            }
            .tabItem {
                Image(systemName: "sportscourt")
                Text("Latest")
            }
            .tag(1)
            
            NavigationView {
                MatchListView(competition: competition, type: .upcoming)
                    .navigationBarTitle("Upcoming")
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Upcoming")
            }
            .tag(2)
            
       
            NavigationView {
                ScorerListView()
            }
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Top Scorers")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(Utilities.isRunningOnIpad ? .top : .init())
    }
}
