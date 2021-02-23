//
//  TeamDetailView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct TeamDetailView: View {
    var teamToFetch: Team
    @StateObject var teamDetailViewModel = TeamDetailViewModel()
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false, content: {
            
            // Pinned View...
            
            if teamDetailViewModel.team != nil{
                //
                LazyVGrid(columns: columns,spacing: 20){
                    
                    TeamHeaderView(team: teamDetailViewModel.team!)
                    ClubInformationView(team: teamDetailViewModel.team!)
                    if teamDetailViewModel.team!.squad != nil {
                        TeamSquadView(players: teamDetailViewModel.team!.squad!)
                    }
                }
                .padding()
            }
        })
            
            .onAppear(perform: {
                self.teamDetailViewModel.fetchUpcomingMatches(teamId: self.teamToFetch.id)
            })
            .navigationBarTitle(teamToFetch.name)
    }
}
