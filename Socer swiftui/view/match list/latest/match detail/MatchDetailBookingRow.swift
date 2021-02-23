//
//  MatchDetailBookingRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailBookingRow: View {
    var home: MatchDetailBooking?
    var away: MatchDetailBooking?
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                if home != nil {
                    Text("\(home!.isRedCard ? "🟥" : "🟨" ) \(home!.minute)'")
                    Text(home!.player.name)
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            
            HStack {
                if away != nil {
                    
                    Text("\(home!.isRedCard ? "🟥" : "🟨" ) \(away!.minute)'")
                    Text(away!.player.name)
                    
                }
                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}
