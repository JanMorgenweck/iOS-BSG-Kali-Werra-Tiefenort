//
//  ImpressumHilfsView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//

import SwiftUI

struct ImpressumHilfsView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Angaben gemäß § 5 TMG")
                .font(.title)
                .padding(.top)
            Text(LocalizedStringKey("adresse"))
                .padding(.vertical)
            Text("Vertreten durch den Vorstand:")
                .font(.headline)
            Text("Markus Peter (Vorstandsvorsitzender)")
            
            Text("Kontakt")
                .font(.title)
                .padding(.vertical)
            Text("Email: info@kali-werra.de")
                .padding(.bottom)
            
            Text("Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV")
                .font(.title)
                .padding(.bottom)
            Text("BSG Kali Werra Tiefenort e.V.")
                .font(.headline)
            Text(LocalizedStringKey("geschäftsstelle"))
                .padding(.bottom)
            Text(LocalizedStringKey("verpflichtung"))
            
            Text("Haftung für Inhalte")
                .font(.title)
                .padding(.vertical)
            Text(LocalizedStringKey("Dienstanbieter"))
            
            
            Text("Haftung für Links")
                .font(.title)
                .padding(.vertical)
            Text(LocalizedStringKey("Angebot"))
            
            Text("Urheberrecht")
                .font(.title)
                .padding(.vertical)
            Text(LocalizedStringKey("Seitenbetreiber"))
                .padding(.bottom)
            
            Link("Quelle: https://www.e-recht24.de/impressum-generator.html", destination: URL(string: "https://www.e-recht24.de/impressum-generator.html")!)
        }
        .padding(.horizontal)
    }
}
