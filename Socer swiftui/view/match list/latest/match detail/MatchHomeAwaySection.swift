//
//  MatchHomeAwaySection.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI


struct MatchHomeAwaySection<T: Identifiable, K, Content: View>: View where T.ID == K, T: Equatable {
    
    var homeTeamId: K
    var awayTeamId: K
    var data: [T]
    var content: (T?, T?) -> Content
    
    var homes: [T] {
        return data.filter { $0.id == homeTeamId}
    }
    
    var aways: [T] {
        return data.filter { $0.id == awayTeamId }
    }
    
    var totalCount: Int {
        return homes.count >= aways.count ? homes.count : aways.count
    }
    
    func homeAt(index: Int) -> T? {
        guard homes.count > index else {
            return nil
        }
        return homes[index]
    }
    
    func awayAt(index: Int) -> T? {
        guard aways.count > index else {
            return nil
        }
        return aways[index]
    }
    
    
    var body: some View {
        ForEach(0..<self.totalCount) {
            self.content(self.homeAt(index: $0), self.awayAt(index: $0))
        }
        
    }
}
