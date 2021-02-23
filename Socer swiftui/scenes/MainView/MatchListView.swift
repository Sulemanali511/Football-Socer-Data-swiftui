//
//  MatchListView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

enum MatchListType {
    case latest
    case upcoming
}

struct MatchListView: View {
    
    let competition: Competition
    let type: MatchListType
    @StateObject var modelListViewModel = MatchListViewModel()
    
    var body: some View {
        List(self.modelListViewModel.matches) {
            MatchListRow(match: $0)
        }
    .onAppear {
        switch self.type {
        case .latest:
            self.modelListViewModel.fetchLatestMatches(competitionId: self.competition.id)
        case .upcoming:
            self.modelListViewModel.fetchUpcomingMatches(competitionId: self.competition.id)
        }
    }
    }
}
