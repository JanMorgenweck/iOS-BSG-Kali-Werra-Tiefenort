//
//  AuthClient.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 19.08.24.
//

import Foundation
import FirebaseAuth

class AuthClient {
    
    static let shared = AuthClient()
    private let auth = Auth.auth()
        
    init() {}
    
    var uid: String? {
        auth.currentUser?.uid
    }
    
    func getCurrentUser() -> FirebaseAuth.User? {
        return auth.currentUser
    }
    
    func checkAuth() -> Bool {
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await auth.signIn(withEmail: email, password: password)
        return result.user
    }
    
    func register(email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await auth.createUser(withEmail: email, password: password)
        return result.user
    }
    
    func logout() throws {
        try auth.signOut()
    }
    
    func deleteUser() async throws {
        if let user = auth.currentUser {
            try await user.delete()
        }
    }
}
