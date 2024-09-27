//
//  EmailAdressView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//

import SwiftUI

struct EmailAdressView: View {
    var body: some View {
        
        
        Text("Allegmeine Anfragen")
            .font(.headline)
        Text("info@kali-werra.de")
            .padding(.bottom)
        
        Text("Spielbetrieb Herren")
            .font(.headline)
        Text("sport@kali-werra.de")
        
        Text("Spielbetrieb Nachwuchs")
            .font(.headline)
        Text("nachwuchs@kali-werra.de")
        
        Text("Sektion Dart")
            .font(.headline)
        Text("dart@kali-werra.de")
            .padding(.bottom)
        
        Text("Verwaltung")
            .font(.headline)
        Text("organisation@kali-werra.de")
            .padding(.bottom)
        
        Text("Sponsoring")
            .font(.headline)
        Text("vermarktung@kali-werra.de")
            .padding(.bottom, 32)
    }
}
