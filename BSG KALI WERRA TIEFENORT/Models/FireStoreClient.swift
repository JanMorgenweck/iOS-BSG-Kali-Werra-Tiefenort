////
//  FireStoreClient.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 19.08.24.
//

import Foundation
import FirebaseFirestore

protocol NewsFetchable {
    func fetchNews() async throws -> [News]
}

class FireStoreClient: NewsFetchable {
    
    static let shared = FireStoreClient()
    
    private let store = Firestore.firestore()
    
    
    func createUser(uid: String, email: String, username: String) throws {
        let user = FireUser(uid: uid, email: email, registeredAt: Date.now, username: username)
        try store.collection("users")
            .document(uid)
            .setData(from: user)
    }
    
    func getUser(uid:String) async -> FireUser? {
        return try? await store
            .collection("users")
            .document(uid)
            .getDocument()
            .data(as: FireUser.self)
    }
    
    func updateUsername(uid: String, newUsername: String) async throws {
        try await store.collection("users")
            .document(uid)
            .updateData(["username": newUsername])
    }
    
    func fetchNews() async throws -> [News] {
            let querySnapshot = try await store.collection("news")
                .order(by: "date", descending: true)
                .getDocuments()
            
            return querySnapshot.documents.compactMap { doc in
                let data = doc.data()
                let image = data["image"] as? String ?? ""
                let header = data["header"] as? String ?? ""
                let date = data["date"] as? String ?? ""
                let shorttext = data["shorttext"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                let linktext = data["linktext"] as? String
                let link = data["link"] as? String
                let images = data["images"] as? [String] ?? []
                
                return News(image: image, header: header, date: date, shorttext: shorttext, text: text, linktext: linktext, link: link, images: images)
            }
        }
    
    
    func fetchMannschaften() async throws -> [Mannschaft] {
        let querySnapshot = try await store.collection("mannschaften").getDocuments()
        var mannschaften: [Mannschaft] = []
        for document in querySnapshot.documents {
            let data = document.data()
            print(data)
            
            do {
                let mannschaft = try JSONDecoder().decode(Mannschaft.self, from: JSONSerialization.data(withJSONObject: data))
                mannschaften.append(mannschaft)
            } catch {
                print("Error decoding document: \(error.localizedDescription)")
            }
        }
        return mannschaften
    }
    
    func saveMannschaft(_ mannschaft: Mannschaft) async throws {
            let documentId = mannschaft.id
            try store.collection("mannschaften")
                .document(documentId)
                .setData(from: mannschaft)
        }

}

class MockFireStoreClient: NewsFetchable {
    var shouldThrowError = false
    
    func fetchNews() async throws -> [News] {
        if shouldThrowError {
            throw NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        
        return [
            News(
                image: "image1.png",
                header: "News Title 1",
                date: "2023-09-19",
                shorttext: "This is a short text",
                text: "This is a detailed text",
                linktext: "Read more",
                link: "http://example.com",
                images: ["image1.png", "image2.png"]
            ),
            News(
                image: "image2.png",
                header: "News Title 2",
                date: "2023-09-20",
                shorttext: "Another short text",
                text: "More detailed text",
                linktext: nil,
                link: nil,
                images: ["image3.png"]
            )
        ]
    }
}
