//
//  SessionManager.swift
//  CTE
//
//  Created by Leo Taylor on 8/1/23.
//

import SwiftUI

class SessionManager: ObservableObject {
    @Published var isLoggedIn = false
    // Add more properties as needed

    // Add methods to modify the session state
    func login() {
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
    }
}
