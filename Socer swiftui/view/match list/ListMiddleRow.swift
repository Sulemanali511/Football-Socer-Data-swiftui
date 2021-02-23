//
//  ListMiddleRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI

struct ListMiddleRow: View {
    var title: String
    var leftValue: String
    var rightValue: String
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                Text(leftValue)
                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            HStack {
                Text(formattedMiddle)
                    .font(.headline)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            
            HStack {
                Spacer()
                Text(rightValue)
                    .multilineTextAlignment(.trailing)
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
        }
    }
    
    var formattedMiddle: String {
        return title.paddedToWidth(12)
    }
}
