//
//  StandingView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct StandingView: View {
    let competition: Competition
    @StateObject var standingViewModel = StandingViewModel()

    var body: some View {
        List {
            Section(header: VStack(spacing: 8) {
                Text(competition.name)
                    .font(.headline)
                Divider()
                
                HStack {
                    Text("Club")
                        .font(.headline)
                    Spacer()
                    Text(self.headerText())
                        .font(.headline)
                        .multilineTextAlignment(.trailing)
                }
                
            }.padding(.vertical)) {
                ForEach(self.standingViewModel.table) { (teamStanding) in
                    StandingTeamRow(teamStanding: teamStanding)
                }
            }
        }
        
            .onAppear(perform: {
                self.standingViewModel.fetchLatestStanding(competitionId: self.competition.id)
            })
            .navigationBarTitle("Standings")
    }
}

struct StandingView_Previews: PreviewProvider {
    static var previews: some View {
        StandingView(competition: Competition.defaultCompetitions[0])
    }
}
