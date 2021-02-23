//
//  TeamSquadView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct TeamSquadView: View {
    
    let players: [Player]
    @Binding var show:Bool
    @Binding var playerss:Player //= Player(id: 1, name: "Cristiano Ronaldo", firstName: "CR7", dateOfBirth: "1999-11-12", countryOfBirth: "Portugal", nationality: "Portugal", position: "Attacker", shirtNumber: 7)
    
    var body: some View {
        
//        ZStack {
        
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
                    
//                    NavigationLink(destination: PlayerDetailView(player: player)) {
//                        EmptyView()
//                        
//                    }
                }
                .onTapGesture {
                    self.show.toggle()
                    self.playerss=player
                }
            }
        }
         
//            if show {
//
//                PlayerDetailView(player: playerss)
//                    .transition(.move(edge: .bottom))
//            }
//        }
    }
}
