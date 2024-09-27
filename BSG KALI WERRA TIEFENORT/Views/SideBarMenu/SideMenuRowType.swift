//
//  SideMenuRowType.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 20.08.24.
//

import Foundation
import SwiftUI

enum SideMenuRowType: Int, CaseIterable {
    
    case startseite = 0
    case neuigkeiten
    case verein
    case mannschaften
    case ueberUns
    case sponsoren
    case profil
    case datenschutz
    case impressum
    case kontakt
    
    
    var title: String {
        switch self {
            
        case .startseite:
            return "Startseite"
        case .neuigkeiten:
            return "Neuigkeiten"
        case .verein:
            return "Verein"
        case .mannschaften:
            return "Mannschaften"
        case .ueberUns:
            return "Über Uns"
        case .sponsoren:
            return "Sponsoren & Partner"
        case .profil:
            return "Profil"
        case .datenschutz:
            return "Datenschutz"
        case .impressum:
            return "Impressum"
        case .kontakt:
            return "Kontakt"
        }
    }
    
    @MainActor @ViewBuilder
    func destination(presentSideMenu: Binding<Bool>, selectedSideMenuTab: Binding<Int>) -> some View {
        switch self {
            
        case .startseite:
            StartseiteView(presentSideMenu: presentSideMenu, selectedSideMenuTab: selectedSideMenuTab)
        case .neuigkeiten:
            NeuigkeitenView()
        case .verein:
            VereinView()
        case .mannschaften:
            MannschaftenView()
        case .ueberUns:
            UeberUnsView()
        case .sponsoren:
            SponsorenView()
        case .profil:
            ProfileView()
        case .datenschutz:
            DatenschutzView()
        case .impressum:
            ImpressumView()
        case .kontakt:
            KontaktView()
        }
    }
}
