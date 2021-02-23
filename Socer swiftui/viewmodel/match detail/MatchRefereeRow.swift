//
//  MatchRefereeRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchRefereeRow: View {
    var referee: Player
    
    var body: some View {
        HStack {
            Text("\(referee.name) \(referee.nationality ?? "")")
        }
    }
}
