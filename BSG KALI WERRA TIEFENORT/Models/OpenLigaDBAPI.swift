//
//  OpenLigaDBAPI.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 28.08.24.
//

import Foundation

class OpenLigaDBAPI {
    private let baseUrl = "https://api.openligadb.de"
    
    func fetchNextMatch(leagueId: Int, teamId: Int) async throws -> Data {
        let url = URL(string: "\(baseUrl)/getnextmatchbyleagueteam/\(leagueId)/\(teamId)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    func fetchLastMatch(leagueId: Int, teamId: Int) async throws -> Data {
        let url = URL(string: "\(baseUrl)/getlastmatchbyleagueteam/\(leagueId)/\(teamId)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
            }
            
            return data
    }
    
    func getTable(leagueShortcut: String, leagueSeason: Int) async throws -> Data {
        let url = URL(string: "\(baseUrl)/getbltable/\(leagueShortcut)/\(leagueSeason)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
