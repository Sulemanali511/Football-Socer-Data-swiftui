//
//  Socer_swiftuiApp.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

@main
struct Socer_swiftuiApp: App {
    var ss = ImageLoader()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ss)
        }
    }
}
