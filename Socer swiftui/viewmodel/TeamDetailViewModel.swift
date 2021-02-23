//
//  TeamDetailViewModel.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

class TeamDetailViewModel: ObservableObject {
    
    @Published var team: Team?
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    @Published var notFoundData = true
//    @Published var isLoading = false
    
    var service = FootballDataService.shared
    
    func fetchUpcomingMatches(teamId: Int) {
        error = nil
        isLoading = true
        
        service.fetchTeamDetail(teamId: teamId) { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let team):
                    self.team = team
                    
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
}
