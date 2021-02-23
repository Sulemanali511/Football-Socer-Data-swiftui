//
//  MatchPlayerHomeAwaySection.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchPlayerHomeAwaySection<T: Identifiable, Content: View>: View where T: Equatable {
    
    var homes: [T]
    var aways: [T]
    var content: (T?, T?) -> Content
    
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
