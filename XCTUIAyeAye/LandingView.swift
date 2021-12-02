//
//  ContentView.swift
//  XCTUIAyeAye
//
//  Created by My3 Shenoy on 11/16/21.
//

import SwiftUI

struct LandingView: View {
    // Indicates whether the login should be presented or not
    @State private var showLogin = false
    
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.title)
            
            Spacer().frame(height: 20)
            
            Button(action: {
                showLogin = true
            }, label: {
                Text("Login")
            })
                .accessibilityIdentifier("loginButton")
                .sheet(isPresented: $showLogin) {
                    LoginView()
                }
        }
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
