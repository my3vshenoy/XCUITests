//
//  XCTUIAyeAyeApp.swift
//  XCTUIAyeAye
//
//  Created by My3 Shenoy on 11/16/21.
//

import SwiftUI

@main
struct XCTUIAyeAyeApp: App {
    // We want the user object to be available across the entire app
    // Hence we add it into this file
    var user = User()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(user)
        }
    }
}
