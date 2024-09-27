//
//  Match.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 28.08.24.
//

import Foundation

struct Match: Codable {
    let matchID: Int
    let matchDateTime: String?
    let timeZoneID: String?
    let leagueId: Int
    let leagueName: String?
    let leagueSeason: Int
    let leagueShortcut: String?
    let matchDateTimeUTC: String?
    let group: LigaGroup?
    let team1: Team
    let team2: Team
    let lastUpdateDateTime: String?
    let matchIsFinished: Bool
    let matchResults: [MatchResult]?
    let goals: [Goal]?
    let location: Location?
    let numberOfViewers: Int?
}

struct LigaGroup: Codable {
    let groupName: String?
    let groupOrderID: Int
    let groupID: Int
}

struct Team: Codable {
    let teamId: Int
    let teamName: String?
    let shortName: String?
    let teamIconUrl: String?
    let teamGroupName: String?
}

struct MatchResult: Codable {
    let resultID: Int
    let resultName: String?
    let pointsTeam1: Int?
    let pointsTeam2: Int?
    let resultOrderID: Int
    let resultTypeID: Int
    let resultDescription: String?
}

struct Goal: Codable {
    let goalID: Int
    let scoreTeam1: Int?
    let scoreTeam2: Int?
    let matchMinute: Int?
    let goalGetterID: Int
    let goalGetterName: String?
    let isPenalty: Bool
    let isOwnGoal: Bool
    let isOvertime: Bool
    let comment: String?
}

struct Location: Codable {
    let locationID: Int
    let locationCity: String?
    let locationStadium: String?
}

struct TableEntry: Codable, Identifiable {
    let id: Int
    let teamName: String
    let teamIconUrl: String
    let matches: Int
    let won: Int
    let draw: Int
    let lost: Int
    let points: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "teamInfoId"
        case teamName = "teamName"
        case teamIconUrl = "teamIconUrl"
        case matches = "matches"
        case won = "won"
        case draw = "draw"
        case lost = "lost"
        case points = "points"
    }
}
