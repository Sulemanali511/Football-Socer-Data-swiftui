//
//  MatchListViewModel.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

class MatchListViewModel: ObservableObject {
    @Published var matches: [Match] = []
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    @Published var notFoundData = true
    
    var service = FootballDataService.shared
    
}
