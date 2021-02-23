//
//  LeftRightRow.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct LeftRightRow: View {
    let title: String
    let subtitle: String
        
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.body)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(subtitle)
                .font(.headline)
                .multilineTextAlignment(.trailing)
        }
    }
}
