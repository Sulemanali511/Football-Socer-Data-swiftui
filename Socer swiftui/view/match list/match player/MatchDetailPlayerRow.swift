//
//  MatchDetailPlayerRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailPlayerRow: View {
    var home: Player?
    var away: Player?
    
    func playerRow(with player: Player) -> String {
        "\(player.shirtNumber != nil ? "\(player.shirtNumber!)" : "") \(player.name) (\(player.position!))"
        
    }
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            HStack {
                if home != nil {
                    
                    Text(playerRow(with: home!))
                }
                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            HStack {
                Spacer()
                
                if away != nil {
                    
                    Text(playerRow(with: away!))
                        .multilineTextAlignment(.trailing)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
        }
        
        
    }
}
