//
//  MatchDetailGoalRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailGoalRow: View {
    var homeGoal: MatchDetailGoal?
    var awayGoal: MatchDetailGoal?
    
    var body: some View {
        HStack(spacing: 0) {
            
            HStack {
                if homeGoal != nil {
                    Text("⚽️ \(homeGoal!.minute)'")
                    Text(homeGoal!.scorer!.name)
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            
            
            HStack {
                if awayGoal != nil {
                    Text("⚽️ \(awayGoal!.minute)'")
                    Text(awayGoal!.scorer!.name)
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}
