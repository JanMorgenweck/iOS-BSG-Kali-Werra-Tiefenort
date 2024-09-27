//
//  AuthView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 19.08.24.
//

import SwiftUI

enum Phase {
    case welcome
    case auth
}

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var isLoginMode: Bool = true
    @State private var selectedSideMenuTab: Int = 0
    @State private var isSidebarOpen: Bool = false
    
    var body: some View {
        ZStack {
            Image("Logo-BSG-Kali-Werra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .opacity(0.05)
            VStack {
                Text(isLoginMode ? "Login" : "Registrieren")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .padding(.horizontal)
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal)
                
                SecureField("Passwort", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(.horizontal)
                
                if !isLoginMode {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Passwortanforderungen:")
                            .font(.headline)
                            .padding(.top)
                        
                        Text("• Mindestens 8 Zeichen lang")
                        Text("• Mindestens ein kleiner Buchstabe (a-z)")
                        Text("• Mindestens ein Großbuchstabe (A-Z)")
                        Text("• Mindestens eine Ziffer (0-9)")
                        Text("• Mindestens ein Sonderzeichen")
                        .padding(.bottom)
                }
                    .padding(.horizontal)
            }
                
                Button(action: {
                    if isLoginMode {
                        viewModel.login()
                    } else {
                        viewModel.register(username: viewModel.username)
                        
                    }
                }) {
                    Text(isLoginMode ? "Login" : "Registrieren")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                        .padding(.top)
                }
                
                Button(action: {
                    isLoginMode.toggle()
                }) {
                    Text(isLoginMode ? "Kein Accout? Hier registrieren!" : "Bereits ein Account? Hier einloggen!")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .padding(.top)
                }
            }
            .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert, actions: {
                Button("OK", role: .cancel, action: {
                    
                })
            })
            
            .fullScreenCover(isPresented: $viewModel.showMainView) {
                StartseiteView( presentSideMenu: $isSidebarOpen, selectedSideMenuTab: $selectedSideMenuTab)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    AuthView(viewModel: AuthViewModel())
}
