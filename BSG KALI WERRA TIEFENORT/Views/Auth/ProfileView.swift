//
//  ProfileView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 20.08.24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var newName: String = ""
    @State private var showAlert = false
    @State private var showDeletionAlert = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        ZStack {
            Image("Logo-BSG-Kali-Werra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .opacity(0.05)
            
            VStack(spacing: 20) {
                Text("\(viewModel.username)'s Profil")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                Text("E-Mail: \(viewModel.email)")
                    .font(.headline)
                
                TextField("Username", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal)
                    .onAppear {
                        newName = viewModel.username
                    }
                
                Button(action: {
                    viewModel.updateUsername(newUsername: newName) { success in
                        if success {
                            showAlert = true
                        } else {
                            errorMessage = "Fehler beim Ändern des Namens. Bitte versuche es später erneut."
                        }
                    }
                }) {
                    Text("Namen ändern")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()
                }
                .alert("Name erfolgreich geändert!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                
                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                        .padding()
                }
                
                Button(action: {
                    
                    showDeletionAlert = true
                }) {
                    Text("Account löschen")
                        .font(.headline)
                        .foregroundStyle(.red)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                        .padding()
                }
                .alert("Bist du sicher, dass du dein Konto löschen möchtest? Diese Aktion kann nicht rückgängig gemacht werden.", isPresented: $showDeletionAlert) {
                    Button("Abbrechen", role: .cancel) {}
                    Button("Löschen", role: .destructive) {
                        viewModel.deleteUser()
                    }
                }
                
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
