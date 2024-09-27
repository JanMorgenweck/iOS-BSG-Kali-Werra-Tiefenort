//
//  MatchView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 28.08.24.
//

import SwiftUI

struct MatchView: View {
    @StateObject var matchViewModel: MatchViewModel
    
    
    
    
    var body: some View {
        ZStack {
            Image("Logo-BSG-Kali-Werra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .opacity(0.05)
            VStack {
                Text(matchViewModel.mannschaft.name)
                    .font(.headline)
                    .padding(.top)
                
                if let errorMessage = matchViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    if let lastMatch = matchViewModel.lastMatch {
                        VStack(alignment:.center, spacing: 10){
                            Text("Letztes Spiel")
                                .font(.subheadline)
                                .padding(.top, 10)
                            
                            Text(lastMatch.matchDateTime ?? "Datum Unbekannt")
                            
                            
                            HStack {
                                if let team1IconUrl = lastMatch.team1.teamIconUrl, let url = URL(string: team1IconUrl) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                Text(lastMatch.team1.teamName ?? "Team 1")
                            }
                            
                            if let result = lastMatch.matchResults?.first {
                                Text("\(result.pointsTeam1 ?? 0) : \(result.pointsTeam2 ?? 0)")
                                    .font(.title2)
                            }
                            
                            HStack {
                                if let team2IconUrl = lastMatch.team2.teamIconUrl, let url = URL(string: team2IconUrl) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                Text(lastMatch.team2.teamName ?? "Team 2")
                            }
                            
                            if let stadium = lastMatch.location?.locationStadium, let city = lastMatch.location?.locationCity {
                                Text("Wo?")
                                Text("\(stadium)")
                                Text("in")
                                Text("\(city)")
                            }
                        }
                        .padding()
                    }
                    Spacer()
                    
                    if let nextMatch = matchViewModel.nextMatch {
                        VStack(alignment: .center, spacing: 10) {
                            Text("Nächstes Spiel")
                                .font(.subheadline)
                                .padding(.top, 10)
                            
                            Text(nextMatch.matchDateTime ?? "Datum Unbekannt")
                            
                            HStack {
                                if let team1IconUrl = nextMatch.team1.teamIconUrl, let url = URL(string: team1IconUrl) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                Text(nextMatch.team1.teamName ?? "Team 1")
                            }
                            
                            
                            Text(":")
                            
                            HStack {
                                
                                if let team2IconUrl = nextMatch.team2.teamIconUrl, let url = URL(string: team2IconUrl) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                Text(nextMatch.team2.teamName ?? "Team 2")
                            }
                            
                            
                            if let stadium = nextMatch.location?.locationStadium, let city = nextMatch.location?.locationCity {
                                Text("Wo?")
                                Text("\(stadium)")
                                Text("in")
                                Text("\(city)")
                                
                                Spacer()
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}
