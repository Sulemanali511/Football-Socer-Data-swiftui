//
//  TeamSquadView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct TeamSquadView: View {
    
    let players: [Player]
    
    var body: some View {
        Section(header: Text("Squads")) {
            ForEach(players) { player in
                ZStack {
                    HStack(alignment: .top) {
                        if (player.shirtNumber != nil) {
                            Text(String(describing: player.shirtNumber!))
                        }
                        
                        Text("\(player.name) (\(player.nationality ?? ""))")
                            .font(.headline)
                        Spacer()
                        Text(player.position ?? player.role ?? "")
                        
                    }
                    
                    NavigationLink(destination: PlayerDetailView(player: player)) {
                        EmptyView()
                        
                    }
                }
            }
        }
    }
}
