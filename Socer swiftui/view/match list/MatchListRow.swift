//
//  MatchListRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchListRow: View {
    
    var match: Match
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd/MM"
        return formatter
    }()
    
    @EnvironmentObject var homeImageLoader: ImageLoader
    @EnvironmentObject var awayImageLoader: ImageLoader
    
    
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        if checkHome() != "" {
                            WebView(urlString: checkHome())
                                .frame(width: 15,height: 15)
                                .clipShape(Circle())
                        } else {
                            RoundedRectangle(cornerRadius: 7.5)
                                .foregroundColor(.gray)
                                .frame(width: 15, height: 15)
                        }
                        Text(match.homeTeam.name)
                            .font(match.score.isHomeWinner ? .headline : .body)
                    }
                    
                    HStack {
                        if checkAway() != "" {
                            WebView(urlString: checkAway())
                                .frame(width: 30,height: 30)
                                .clipShape(Circle())
                        } else {
                            RoundedRectangle(cornerRadius: 7.5)
                                .foregroundColor(.gray)
                                .frame(width: 15, height: 15)
                        }
                        
                        Text(match.awayTeam.name)
                            .font(match.score.isAwayWinner ? .headline : .body)
                        
                    }
                    
                    
                }
                Spacer()
                
                if match.score.winner != nil {
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        HStack {
                            if match.score.halfTime != nil {
                                MatchListTeamScoreView(title: "HT", score: match.score.halfTime!, isHomeWinner: match.score.isHomeWinner, isAwayWinner: match.score.isAwayWinner)
                            }
                            if match.score.fullTime != nil {
                                MatchListTeamScoreView(title: "FT", score: match.score.fullTime!, isHomeWinner: match.score.isHomeWinner, isAwayWinner: match.score.isAwayWinner)
                            }
                            
                        }
                        Text(MatchListRow.dateFormatter.string(from: match.utcDate))
                    }
                } else {
                    Text(MatchListRow.dateFormatter.string(from: match.utcDate))
                        .font(.headline)
                }
        
            }
            .padding(.vertical)
            
//            NavigationLink(destination: MatchDetailView(matchToFetch: match)) {
//                EmptyView()
//            }
        }
        .onAppear {
//            homeImageLoader.getTeamId(teamId: match.homeTeam.id)
//            awayImageLoader.getTeamId(teamId: match.homeTeam.id)
//            self.homeImageLoader = ImageLoader(teamId: match.homeTeam.id)
//            self.awayImageLoader = ImageLoader(teamId: match.awayTeam.id)
        }
        
    
    }
    
    func checkHome() ->String {
         UserDefaults.get(key: match.homeTeam.id)
    }
    
    func checkAway() ->String {
        UserDefaults.get(key: match.awayTeam.id)
        
    }
    
    
}
