//
//  AuthViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 19.08.24.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    
    private let authClient = AuthClient.shared
    private let store = FireStoreClient.shared
    
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    @Published var user: FirebaseAuth.User?
    
    @Published var showMainView = false
    
    @Published var phase: Phase = .welcome
    
    init() {
        showMainView = authClient.checkAuth()
        if let currentUser = authClient.getCurrentUser() {
            Task {
                await fetchUser(uid: currentUser.uid)
            }
        }
        
    }
    
    func login() {
        Task {
            do {
                user = try await authClient.login(email: email, password: password)
                guard let user else { return }
                if await store.getUser(uid: user.uid) == nil {
                    try store.createUser(uid: user.uid, email: email, username: username)
                } else {
                    await fetchUser(uid: user.uid)
                }
                showMainView = true
            } catch {
                errorMessage = "Email oder Passwaort falsch!"
                showAlert = true
                handleError(error as NSError)
            }
        }
    }
    
    func register(username: String) {
        guard isPasswordValid(password) else {
            errorMessage = "Das Passwort erfüllt nicht die Anforderungen."
            showAlert = true
            return
        }
        Task {
            do {
                user = try await authClient.register(email: email, password: password)
                guard let user else { return }
                try store.createUser(uid: user.uid, email: email, username: username)
                showMainView = true
            } catch {
                handleError(error as NSError)
            }
        }
    }
    
    func logout() {
        do {
            try authClient.logout()
            showMainView = false
        } catch {
            handleError(error as NSError)
        }
    }
    
    func deleteUser() {
        Task {
            do {
                try await authClient.deleteUser()
                showMainView = false
            } catch {
                handleError(error as NSError)
            }
        }
    }
    
    func fetchUser(uid: String)  async {
        Task {
            guard let fireUser = await store.getUser(uid: uid) else { return }
            self.username = fireUser.username
            self.email = fireUser.email
        }
    }
    
    func updateUsername(newUsername: String, completion: @escaping (Bool) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User is not logged in")
            completion(false)
            return
        }
        Task {
            do {
                try await store.updateUsername(uid: userId, newUsername: newUsername)
                self.username = newUsername
                completion(true)
            } catch {
                print("Failed to update username: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    private func isPasswordValid(_ password: String) -> Bool {
            // Mindestlänge
            guard password.count >= 8 else { return false }
            
            // Kleinbuchstaben
            let lowercaseRegex = ".*[a-z].*"
            let lowercasePredicate = NSPredicate(format:"SELF MATCHES %@", lowercaseRegex)
            guard lowercasePredicate.evaluate(with: password) else { return false }
            
            // Großbuchstaben
            let uppercaseRegex = ".*[A-Z].*"
            let uppercasePredicate = NSPredicate(format:"SELF MATCHES %@", uppercaseRegex)
            guard uppercasePredicate.evaluate(with: password) else { return false }
            
            // Ziffern
            let digitRegex = ".*[0-9].*"
            let digitPredicate = NSPredicate(format:"SELF MATCHES %@", digitRegex)
            guard digitPredicate.evaluate(with: password) else { return false }
            
            // Sonderzeichen
            let specialCharRegex = ".*[^A-Za-z0-9].*"
            let specialCharPredicate = NSPredicate(format:"SELF MATCHES %@", specialCharRegex)
            guard specialCharPredicate.evaluate(with: password) else { return false }
            
            return true
        }
    
    private func handleError(_ error: NSError) {
        print(error.localizedDescription)
        
        let errorCode = AuthErrorCode(rawValue: error.code)
        
        switch errorCode {
        case .userNotFound:
            errorMessage = "User nicht gefunden"
        case .invalidCredential, .wrongPassword, .invalidEmail:
            errorMessage = "Falsche Zugangsdaten"
        case .userDisabled:
            errorMessage = "Benutzer:in wurde deaktiviert"
        case .emailAlreadyInUse, .accountExistsWithDifferentCredential, .credentialAlreadyInUse:
            errorMessage = "User mit dieser Email besteht bereits"
        case .networkError:
            errorMessage = "Netzwerkfehler"
        case .weakPassword:
            errorMessage = "Passwort ist zu schwach"
        default:
            errorMessage = "Unbekannter Fehler"
        }
        
        showAlert = true
    }
}
