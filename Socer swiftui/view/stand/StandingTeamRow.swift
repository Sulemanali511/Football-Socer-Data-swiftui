//
//  StandingTeamRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct StandingTeamRow: View {
    
    var teamStanding: TeamStandingTable
    @StateObject var imageLoader = ImageLoader()
    
    init(teamStanding: TeamStandingTable) {
        self.teamStanding = teamStanding
        guard let crestText = self.teamStanding.team.crestUrl, let crestURL = URL(string: crestText) else {
            return
        }
        self.imageLoader.downloadImage(url: crestURL, teamId: teamStanding.team.id)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StandingTeamRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingTeamRow()
    }
}
