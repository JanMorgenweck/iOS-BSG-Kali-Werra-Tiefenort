//
//  NewsViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 21.08.24.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var error: Error?
    private var store: NewsFetchable
    
    init(store: NewsFetchable = FireStoreClient.shared) {
        self.store = store
    }
    
    func fetchNews() async {
        do {
            let newsItems = try await store.fetchNews()
            self.news = newsItems
        } catch {
            self.error = error
        }
    }
}
