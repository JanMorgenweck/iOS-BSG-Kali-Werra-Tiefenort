//
//  Team.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 26.08.24.
//

import Foundation

enum Teams: String, CaseIterable, Identifiable {
    case gJunioren = "G-Junioren"
    case fJunioren = "F-Junioren"
    case eJunioren = "E-Junioren"
    case eJuniorinnen = "E-Juniorinnen"
    case dJuniorinnen = "D-Juniorinnen"
    case dJunioren = "D-Junioren"
    case cJunioren = "C-Junioren"
    case bJunioren = "B-Junioren"
    case aJunioren = "A-Junioren"
    case herren = "Herren"
    case edleHerren = "Edle Herren"
    case sektionDart = "Sektion Dart"
    case passiv = "Passiv"
    
    var id: String { self.rawValue }
}
