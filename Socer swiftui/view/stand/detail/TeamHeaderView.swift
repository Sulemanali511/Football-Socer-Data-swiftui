//
//  TeamHeaderView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct TeamHeaderView: View {
    let team: Team
    @StateObject var imageLoader = ImageLoader()
    
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                }
                else {
                    RoundedRectangle(cornerRadius: 120)
                        .foregroundColor(.gray)
                        .frame(width: 240, height: 240)
                }
                Text("\(team.name) (\(team.tla ?? team.name))")
                    .font(.headline)
                Text(team.area?.name ?? "")
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.vertical)
        .onAppear {
            guard let crest = self.team.crestUrl, let crestURL = URL(string: crest) else {
                return
            }
            self.imageLoader.downloadImage(url: crestURL, teamId: self.team.id)
        }
    }
}
