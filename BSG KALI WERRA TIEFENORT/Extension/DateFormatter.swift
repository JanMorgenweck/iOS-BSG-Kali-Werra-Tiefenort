//
//  DateFormatter.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 28.08.24.
//

import Foundation
extension DateFormatter {
    static let shortDateTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm" // Formatierung anpassen
        return formatter
    }()
}
