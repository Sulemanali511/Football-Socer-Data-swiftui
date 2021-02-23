//
//  ClubInformationView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct ClubInformationView: View {
    let team: Team
    
    var body: some View {
        Section(header: Text("Club Information")) {
            LeftRightRow(title: "Founded", subtitle: String(describing: team.founded ?? 0))
            LeftRightRow(title: "Venue", subtitle: team.venue ?? "")
            LeftRightRow(title: "Club Colors", subtitle: team.clubColors ?? "")
            LeftRightRow(title: "Address", subtitle: team.address ?? "")
            LeftRightRow(title: "Phone", subtitle: team.phone ?? "")
            LeftRightRow(title: "Website", subtitle: team.website ?? "")
            LeftRightRow(title: "Email", subtitle: team.email ?? "")
        }
    }
}
