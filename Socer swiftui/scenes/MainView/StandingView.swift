//
//  StandingView.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct StandingView: View {
    let competition: Competition
    @StateObject var standingViewModel = StandingViewModel()
    var columns = Array(repeating: GridItem(.flexible(), spacing: 60), count: 1)
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top

    var body: some View {
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Text("Standings")
                    .font(.title)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.black)
                })
                
            }
//            .padding(.top,top)
            .padding(.bottom,10)
            .padding(.horizontal)
//            .padding(.top,UIApplication.shared.delegate.sa)
            
            
                
                VStack(spacing: 8) {
                    
                    Text(competition.name)
                        .font(.headline)
                    
                    Divider()
                    
                    HStack {
                        Text("Club")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text(self.headerText())
                            .font(.headline)
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
                .padding()
                .background(Color.gray)
               
                if standingViewModel.notFoundData {
                    Text("No search artist done before!")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.top,55)

                    Spacer()
                } else

                if standingViewModel.table.isEmpty{

                    // loading View...
                    ProgressView()
                        .padding(.top,55)

                    Spacer()
                }

                else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: columns,spacing: 20){

                            ForEach(self.standingViewModel.table) { (teamStanding) in
                                StandingTeamRow(teamStanding: teamStanding)
                            }
                            .padding()
                        }
                    }
                    
                    
                }
                
                Spacer(minLength: 0)
        }
        .onAppear(perform: {
            self.standingViewModel.fetchLatestStanding(competitionId: self.competition.id)
        })
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
    
    func headerText() -> String {
        let headers = ["MP","W","D","L","GF","GA","GD","Pts"].map { $0.padding(toLength: 3, withPad: " ", startingAt: 0)}.reduce("", +)
        return headers
    }
}

struct StandingView_Previews: PreviewProvider {
    static var previews: some View {
        StandingView(competition: Competition.defaultCompetitions[0])
    }
}
