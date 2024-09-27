//
//  MannschaftDetailView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 27.08.24.
//

import SwiftUI

struct MannschaftDetailView: View {
    
    let mannschaft: Mannschaft
    
    var body: some View {
        ScrollView{
            Text(mannschaft.name)
                .font(.title2)
                .fontWeight(.bold)
            
            AsyncImage(url: URL(string: mannschaft.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
                
            }
            .padding()
            
            Text(mannschaft.info ?? "")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding(8)
                
            
            Text(mannschaft.email ?? "")
                
                .multilineTextAlignment(.center)
                .padding(4)
            
            if !mannschaft.link!.isEmpty {
                Link(destination: URL(string: mannschaft.link!)!) {
                    Text(mannschaft.fbde!)
                        .foregroundStyle(.black)
                        .padding(4)
                }
                
                NavigationLink("zur aktuellen Tabelle", destination: TabelleView(tabelleViewModel: TabelleViewModel(mannschaft: mannschaft)))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(4)
                
                NavigationLink("zu den Spielen",destination: MatchView(matchViewModel: MatchViewModel(mannschaft: mannschaft)))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(4)
            }
        }
    }
}

#Preview {
    MannschaftDetailView(mannschaft: Mannschaft(id: "1",name: "1.Herren Mannschaft", image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-22-23_web-1536x1024.jpg?alt=media&token=6972404a-0f69-48dc-9b31-ed7e3980ad19", info:"""
                Trainingszeiten:
                
                Dienstag: 18:30 Uhr bis 20:00 Uhr | Sportplatz Frauensee
                
                Freitag: 18:30 Uhr bis 20:00 Uhr | Waldstadion Kaffeetälchen
                
                Ansprechpartner: Pierre Cravaack
                """, email: "kali-werra-tiefenort@outlook.de", fbde: "Ergebnisse auf FUSSBALL.DE", link: "https://www.fussball.de/mannschaft/sg-fsv-kali-werra-tiefenort-fsv-kali-werra-tiefenort-thueringen/-/saison/2324/team-id/011MIAF2K0000000VTVG0001VTR8C1K7#!/", leagueShortcut: "", leagueSeason: 0, leagueId: 0, teamId: 0))
}
