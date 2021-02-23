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
    @State var show:Bool = false
    @State var playerss:Player = Player(id: 1, name: "Cristiano Ronaldo", firstName: "CR7", dateOfBirth: "1999-11-12", countryOfBirth: "Portugal", nationality: "Portugal", position: "Attacker", shirtNumber: 7)
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    var body: some View {
       
        ZStack {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            // Pinned View...
            
            if teamDetailViewModel.team != nil{
                //
                LazyVGrid(columns: columns,spacing: 20){
                    
                    TeamHeaderView(team: teamDetailViewModel.team!)
                    ClubInformationView(team: teamDetailViewModel.team!)
                    if teamDetailViewModel.team!.squad != nil {
                        TeamSquadView(players: teamDetailViewModel.team!.squad!,show:$show,playerss:$playerss)
                    }
                }
                .padding()
            }
        })
        .opacity(show ? 0 : 1)
            
            if show {

                PlayerDetailView(player: playerss,show:$show)
                    .transition(.move(edge: .bottom))
            }
        }
            .onAppear(perform: {
                self.teamDetailViewModel.fetchUpcomingMatches(teamId: self.teamToFetch.id)
            })
            .navigationBarTitle(teamToFetch.name)
    }
}
