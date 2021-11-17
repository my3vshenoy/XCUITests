//
//  User.swift
//  XCTUIAyeAye
//
//  Created by My3 Shenoy on 11/16/21.
//

import Foundation
import Combine

class User: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    @Published var password = ""
    
    func login() -> Bool {
        guard username == "test" && password == "pass" else {
            return false
        }
        
        password = ""
        isLoggedIn = true
        return isLoggedIn
    }
}
