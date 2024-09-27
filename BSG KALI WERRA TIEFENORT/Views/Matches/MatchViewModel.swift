//
//  MatchViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 28.08.24.
//

import Foundation

@MainActor
class MatchViewModel: ObservableObject {
    @Published var nextMatch: Match?
    @Published var lastMatch: Match?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let mannschaft: Mannschaft
    private let api = OpenLigaDBAPI()
    private let leagueId: Int
    private let teamId: Int

    init(mannschaft: Mannschaft) {
        self.mannschaft = mannschaft
        self.leagueId = mannschaft.leagueId ?? 0
        self.teamId = mannschaft.teamId ?? 0
        Task {
            await fetchMatches()
        }
    }
    
    func fetchMatches() async {
        guard leagueId != 0, teamId != 0 else {
            errorMessage = "Anzeige über OpenligaDB nicht möglich. Bitte bei Fussball.de nachschauen!"
            return
        }
        
        isLoading = true
        errorMessage = nil
        do {
            let nextMatchData = try await api.fetchNextMatch(leagueId: leagueId, teamId: teamId)
            let lastMatchData = try await api.fetchLastMatch(leagueId: leagueId, teamId: teamId)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            nextMatch = try decoder.decode(Match.self, from: nextMatchData)
            lastMatch = try decoder.decode(Match.self, from: lastMatchData)
            
            print("Decoded Next Match: \(String(describing: nextMatch))")
            print("Decoded Last Match: \(String(describing: lastMatch))")
        } catch {
            errorMessage = "Fehler beim Laden der Spiele: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
