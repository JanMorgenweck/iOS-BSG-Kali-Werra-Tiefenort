//
//  MannschaftenViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 27.08.24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class MannschaftenViewModel: ObservableObject {
    
    @Published var mannschaften: [Mannschaft] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let store = FireStoreClient.shared
    private let dataSource = DataSource()
    
    init() {
        Task {
            /*await loadAndSaveMannschaften()*/ // wird für Änderungen an der Mannschaft benötigt
            await fetchMannschaften()
        }
    }
    
    
    
    func fetchMannschaften() async {
        isLoading = true
        errorMessage = nil
        do {
            print("Attempting to fetch Mannschaften...")
            let fetchedMannschaften = try await store.fetchMannschaften()
            print("Fetched Mannschaften: \(fetchedMannschaften)")
            self.mannschaften = fetchedMannschaften
        } catch {
            
            print("Error fetching Mannschaften: \(error.localizedDescription)")
            self.errorMessage = "Fehler beim Laden der Mannschaften: \(error.localizedDescription)"
        }
        isLoading = false
        
    }
    
        func loadAndSaveMannschaften() async {
                isLoading = true
                errorMessage = nil
    
                do {
                    // Mannschaften aus der DataSource laden
                    let loadedMannschaften = dataSource.loadMannschaften()
    
                    // Jede Mannschaft in Firestore speichern
                    for mannschaft in loadedMannschaften {
                        try await store.saveMannschaft(mannschaft)
                    }
    
                    // Mannschaften aus Firestore abrufen und in der UI anzeigen
                    let fetchedMannschaften = try await store.fetchMannschaften()
                    self.mannschaften = fetchedMannschaften
                } catch {
                    self.errorMessage = "Fehler beim Laden und Speichern der Mannschaften: \(error.localizedDescription)"
                }
    
                isLoading = false
            }
}
