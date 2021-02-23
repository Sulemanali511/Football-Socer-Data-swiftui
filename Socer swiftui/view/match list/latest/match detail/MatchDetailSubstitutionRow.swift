//
//  MatchDetailSubstitutionRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct MatchDetailSubstitutionRow: View {
    var home: MatchDetailSubtitution?
    var away: MatchDetailSubtitution?
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                if home != nil {
                    
                    Text("\(home!.minute)'")
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.green)
                            Text("\(home!.playerIn.name)")
                            
                        }
                        
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.red)
                            
                            Text("\(home!.playerOut.name)")
                            
                        }
                    }
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            HStack {
                if away != nil {
                    
                    Text("\(away!.minute)'")
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.green)
                            
                            Text("\(away!.playerIn.name)")
                            
                        }
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.red)
                            
                            Text("\(away!.playerOut.name)")
                        }
                    }
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
        }
        
    }
    
}
