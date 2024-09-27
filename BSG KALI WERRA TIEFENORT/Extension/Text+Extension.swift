//
//  Text+Extension.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 09.09.24.
//

import SwiftUI

enum ZeilenUmbruch: String, CaseIterable {
    
    case punkt = ".  "
    case aufrufezeichen = "!  "
    case fragezeichen = "?  "
    
    var satzende: String {
        switch self {
        
        case .punkt:
            return " \n\n"
        case .aufrufezeichen:
            return "!\n\n"
        case .fragezeichen:
            return "?\n\n"
        }
    }
}

extension Text {
    func formatText(text: String, satzende: ZeilenUmbruch) -> Text {
        let formattedText = text.components(separatedBy: satzende.rawValue).joined(separator: satzende.satzende)
        return Text(formattedText)
    }
}
