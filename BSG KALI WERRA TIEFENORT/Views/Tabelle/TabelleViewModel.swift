//
//  TabelleViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 03.09.24.
//

import Foundation

@MainActor
class TabelleViewModel: ObservableObject {
    
    @Published var tableEntries: [TableEntry] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let mannschaft: Mannschaft
    private let api = OpenLigaDBAPI()
    private let leagueShortcut: String
    private let leagueSeason: Int
    
    init(mannschaft: Mannschaft) {
        self.mannschaft = mannschaft
        self.leagueShortcut = mannschaft.leagueShortcut ?? ""
        self.leagueSeason = mannschaft.leagueSeason ?? 0
        Task {
            await getTable()
        }
    }
    
   func getTable() async {
       
       print("getTable() called")
       
       
       guard !leagueShortcut.isEmpty, leagueSeason != 0 else {
           self.errorMessage = "Anzeige über OpenligaDB nicht möglich. Bitte bei Fussball.de nachschauen!"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
       do {
           let data = try await api.getTable(leagueShortcut: leagueShortcut, leagueSeason: leagueSeason)
           if let jsonString = String(data: data, encoding: .utf8) {
                       print("Raw JSON Data: \(jsonString)")
                   }
           let decodedEntries = try JSONDecoder().decode([TableEntry].self, from: data)
           
           Task {
               self.tableEntries = decodedEntries
               self.isLoading = false
               print("Fetched table entries: \(decodedEntries)")
           }
       } catch {
           
               self.errorMessage = "Fehler beim Laden der Tabelle: \(error.localizedDescription)"
               self.isLoading = false
               print("Error: \(error.localizedDescription)")
           
       }
    }
}
