//
//  StandingTeamRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct StandingTeamRow: View {
    
    var teamStanding: TeamStandingTable
//    @StateObject var imageLoader = ImageLoader()
//    @ObservedObject var imageLoader: ImageLoader
    
    init(teamStanding: TeamStandingTable) {
        
        self.teamStanding = teamStanding
        guard let crestText = self.teamStanding.team.crestUrl else {
            return
        }
        UserDefaults.save(key: teamStanding.team.id, value: crestText)
    }
    
    var body: some View {
        //        ZStack {
        HStack() {
            if Utilities.isRunningOnIpad {
                Text(self.positionText(with: teamStanding.position))
                
                if (teamStanding.team.crestUrl != nil) {
                    WebView(urlString: teamStanding.team.crestUrl!)
                        .frame(width: 30,height: 30)
                        .clipShape(Circle())
                } else {
                    RoundedRectangle(cornerRadius: 12.5)
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                }
                
            } else {
                Text(self.positionText(with: teamStanding.position))
                
                //                    if (imageLoader.image != nil) {
                if teamStanding.team.crestUrl != nil {
                    
                    
                    WebView(urlString: teamStanding.team.crestUrl!)
                        .frame(width: 30,height: 30)
                        .clipShape(Circle())
                } else {
                    RoundedRectangle(cornerRadius: 7.5)
                        .foregroundColor(.gray)
                        .frame(width: 15, height: 15)
                }
                
                Text(teamStanding.team.shortName ?? teamStanding.team.name)
                    .multilineTextAlignment(.leading)
            }
            
            
            Spacer()
            Text(self.pointRepresentationRowText(with: teamStanding))
                .frame(width: 210)
                .multilineTextAlignment(.trailing)
        }
        
        //        }
        
    }
    
    
    
    func positionText(with pos: Int) -> String {
        let positionText = String(describing: pos)
        return positionText.padding(toLength: 2, withPad: " ", startingAt: 0)
    }
    
    func pointRepresentationRowText(with table: TeamStandingTable) -> String {
        let rows = ["\(table.playedGames)","\(table.won)", "\(table.draw)","\(table.lost)","\(table.goalsFor)","\(table.goalsAgainst)","\(table.goalDifference)","\(table.points)"].map { $0.padding(toLength: 4, withPad: " ", startingAt: 0)}.reduce("", +)
        return rows
    }
}
