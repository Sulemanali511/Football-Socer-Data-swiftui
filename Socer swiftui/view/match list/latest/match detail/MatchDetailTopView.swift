//
//  MatchDetailTopView.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailTopView: View {
    @ObservedObject var homeImageLoader = ImageLoader()
    let matchToFetch: Match
    let matchDetail: MatchDetail
    
    var body: some View {
        HStack {
            HStack(spacing: 24) {
                VStack {
                    
                    if homeImageLoader.checkHome(match: matchToFetch) != "" {
                        WebView(urlString: homeImageLoader.checkHome(match: matchToFetch))
                            .frame(width:120,height: 120)
                    }
                    else {
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundColor(.gray)
                            .frame(width: 120, height: 120)
                    }
                    
                    Text(matchDetail.homeTeam.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                
                Text("\(matchDetail.score?.fullTime?.homeTeam ?? 0)")
                    .font(.largeTitle)
            }
            Spacer()
            Text("-")
                .font(.title)
            Spacer()
            HStack(spacing: 24) {
                Text("\(matchDetail.score?.fullTime?.awayTeam ?? 0)")
                    .font(.largeTitle)
                VStack {
                    if   homeImageLoader.checkAway(match:  matchToFetch) != "" {
                        WebView(urlString: homeImageLoader.checkAway(match:  matchToFetch) )
                            .frame(width:120,height: 120)
                        
                    }
                    else {
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundColor(.gray)
                            .frame(width: 120, height: 120)
                    }
                    
                    Text(matchDetail.awayTeam.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                
            }
        }
    }
}
