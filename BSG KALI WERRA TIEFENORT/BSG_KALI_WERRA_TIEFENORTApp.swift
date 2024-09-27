//
//  BSG_KALI_WERRA_TIEFENORTApp.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 15.07.24.
//

import SwiftUI
import Firebase

@main
struct BSG_KALI_WERRA_TIEFENORTApp: App {
    
    @StateObject private var viewModel = AuthViewModel()
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        print("Firebase wurde konfiguriert")
    }
    
    var body: some Scene {
        WindowGroup {
            if viewModel.phase == .welcome {
                WelcomeView()
                    .environmentObject(viewModel)
            } else {
                AuthView(viewModel: viewModel)
            }
        }
    }
}
