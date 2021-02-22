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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
