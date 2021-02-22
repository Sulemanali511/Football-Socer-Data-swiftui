//
//  Home.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct Home: View {
    
    private let competitions = Competition.defaultCompetitions
    @State var selectedCompetition: Competition?
    
    var body: some View {
        List(self.competitions) { competition in
            if Utilities.isRunningOnIpad {
                NavigationLink(destination: MainView(competition: competition)) {
                    Text(competition.name)
                }
                
            } else {
                Text(competition.name)
                    .onTapGesture {
                        self.selectedCompetition = competition
                }
                
            }
        }.sheet(item: self.$selectedCompetition, onDismiss: {
            self.selectedCompetition = nil
        }, content: { (competition) in
            MainView(competition: competition)
        })
            .navigationBarTitle("Competitions")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
