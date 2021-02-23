//
//  MatchListTeamScoreView.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchListTeamScoreView: View {
    var title: String
    var score: MatchScoreTime
    var isHomeWinner: Bool
    var isAwayWinner: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Text(title)
                .font(.headline)
            VStack(alignment: .leading, spacing: 16) {
                Text(String(describing: score.homeTeam ?? 0))
                    .font(isHomeWinner ? .headline : .body)
                Text(String(describing: score.awayTeam ?? 0))
                    .font(isAwayWinner ? .headline : .body)
            }
        }
    }
}
