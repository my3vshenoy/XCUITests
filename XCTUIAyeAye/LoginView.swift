//
//  LoginView.swift
//  XCTUIAyeAye
//
//  Created by My3 Shenoy on 11/16/21.
//

import SwiftUI

struct LoginView: View {
    // Pass the environment object/ data model to be accessible in SwiftUI
    @EnvironmentObject private var user: User
    
    // Environment property so we can dismiss the login sheet
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $user.username)
                    SecureField("Password", text: $user.password)
                }
                
                Button {
                    if user.login() {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Login")
                }
                .accessibilityIdentifier("loginNow")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("Dismiss")
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Oops!"), message: Text("Login failed, try again."), dismissButton: Alert.Button.default(Text("OK"), action: {
                showAlert = false
            }))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
