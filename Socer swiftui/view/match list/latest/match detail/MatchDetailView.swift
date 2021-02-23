//
//  MatchDetailView.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailView: View {
    let matchToFetch: Match
    
    var matchDetail: MatchDetail {
        matchDetailViewModel.match!
    }
    @StateObject var matchDetailViewModel = MatchDetailViewModel()
    @StateObject var homeImageLoader = ImageLoader()
    
    var body: some View {
        List {
            if matchDetailViewModel.match != nil {
                VStack(spacing: 16) {
                    
                    MatchDetailTopView(homeImageLoader:homeImageLoader,matchToFetch:matchToFetch,matchDetail:matchDetail)
                    
                    HStack {
                        Spacer()
                        Text("HT \(matchDetail.score?.halfTime?.homeTeam ?? 0) - \(matchDetail.score?.halfTime?.awayTeam ?? 0)")
                            .font(.subheadline)
                        Spacer()
                    }
                    
                    Divider()
                    
                    
                    VStack(spacing: 4) {
                        HStack {
                            Spacer()
                            Text(matchDetail.competition.name)
                                .font(.headline)
                            Text("Matchday \(matchDetail.matchday)")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.bottom)
                        LeftRightRow(title: "Venue", subtitle: matchDetail.venue)
                        LeftRightRow(title: "Attendance", subtitle: "\(matchDetail.attendance == nil ? "-" : "\(matchDetail.attendance!)")")
                        LeftRightRow(title: "Date", subtitle: Utilities.dateFormatter.string(from: matchDetail.utcDate))
                    }
                    .padding(.bottom)
                    
                }
                
                
                if matchDetail.goals != nil && !matchDetail.goals!.isEmpty {
                    Section(header: Text("Scorers")) {
                        MatchHomeAwaySection(homeTeamId: matchDetail.homeTeam.id, awayTeamId: matchDetail.awayTeam.id, data: matchDetail.goals!) { (home, away) in
                            MatchDetailGoalRow(homeGoal: home, awayGoal: away)
                        }
                        
                        
                    }.tag("scorers")
                }
                
                if matchDetail.bookings != nil && !matchDetail.bookings!.isEmpty {
                    Section(header: Text("Bookings")) {
                        MatchHomeAwaySection(homeTeamId: matchDetail.homeTeam.id, awayTeamId: matchDetail.awayTeam.id, data: matchDetail.bookings!) { (home, away)  in
                            MatchDetailBookingRow(home: home, away: away)
                        }
                        
                    }.tag("bookings")
                }
                
                if matchDetail.substitutions != nil && !matchDetail.substitutions!.isEmpty {
                    Section(header: Text("Substitutions")) {
                        MatchHomeAwaySection(homeTeamId: matchDetail.homeTeam.id, awayTeamId: matchDetail.awayTeam.id, data: matchDetail.substitutions!) { (home, away)  in
                            MatchDetailSubstitutionRow(home: home, away: away)
                        }
                    }
                }
                
                Section(header: Text("Team Details")) {
                    ListMiddleRow(title: "Captain", leftValue: matchDetail.homeTeam.captain?.name ?? "", rightValue: matchDetail.awayTeam.captain?.name ?? "-")
                    ListMiddleRow(title: "Coach", leftValue: matchDetail.homeTeam.coach?.name ?? "", rightValue: matchDetail.awayTeam.coach?.name ?? "-")
                    
                }
                
                
                if matchDetail.homeTeam.lineup != nil && matchDetail.awayTeam.lineup != nil {
                    Section(header: Text("Lineup")) {
                        MatchPlayerHomeAwaySection(homes: matchDetail.homeTeam.lineup!, aways: matchDetail.awayTeam.lineup!) { (home, away)  in
                            MatchDetailPlayerRow(home: home, away: away)
                        }
                    }.tag("lineup")
                }
                
                if matchDetail.homeTeam.bench != nil && matchDetail.awayTeam.bench != nil {
                    Section(header: Text("Bench")) {
                        MatchPlayerHomeAwaySection(homes: matchDetail.homeTeam.bench!, aways: matchDetail.awayTeam.bench!) { (home, away)  in
                            MatchDetailPlayerRow(home: home, away: away)
                        }
                    }.tag("bench")
                }
                
                if matchDetail.referees != nil {
                    Section(header: Text("Referee")) {
                        ForEach(matchDetail.referees!) {
                            MatchRefereeRow(referee: $0)
                        }
                    }.tag("referees")
                }
            }
        }
        .onAppear(perform: {
            self.matchDetailViewModel.fetchMatchDetail(matchId: self.matchToFetch.id)
        })
        .navigationBarTitle("Match Detail")
    }
}

