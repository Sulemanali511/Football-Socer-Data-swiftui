//
//  PlayerDetailView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct PlayerDetailView: View {
    let player: Player
    @Binding var show:Bool
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button {
                    withAnimation{
                        self.show.toggle()
                    }
                } label: {
                    Image(systemName:"chevron.backward")
                }
                
                Spacer()
                
                Text(player.name)
                    .fontWeight(.bold)
                
                Spacer()
                
            }
            
            List {
                LeftRightRow(title: "Full Name", subtitle: player.name)
                if (player.shirtNumber != nil) {
                    LeftRightRow(title: "Shirt Number", subtitle: String(describing: player.shirtNumber!))
                }
                
                if player.position != nil {
                    LeftRightRow(title: "Position", subtitle: player.position!)
                }
                
                if player.nationality != nil {
                    LeftRightRow(title: "Nationality", subtitle: player.nationality!)
                }
                
                if player.countryOfBirth != nil {
                    LeftRightRow(title: "Country of Birth", subtitle: player.countryOfBirth!)
                }
                
                if player.dateOfBirth != nil {
                    LeftRightRow(title: "Date of Birth", subtitle: player.dateOfBirth!.replacingOccurrences(of: "T00:00:00Z", with: ""))
                }
            }
            
            Spacer()
            
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}
