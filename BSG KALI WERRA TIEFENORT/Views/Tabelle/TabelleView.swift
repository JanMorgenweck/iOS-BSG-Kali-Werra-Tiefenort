//
//  TabelleView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 03.09.24.
//

import SwiftUI

struct TabelleView: View {
    
    @ObservedObject var tabelleViewModel: TabelleViewModel
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ScrollView {
            ZStack{
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                VStack {
                    Text(tabelleViewModel.mannschaft.name)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 8)
                    
                    Image(systemName: "soccerball")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(isAnimating ? 300 : 0))
                        .animation(
                            Animation.linear(duration: 6.0)
                                .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                        .padding(8)
                    
                    
                    if tabelleViewModel.isLoading {
                        ProgressView()
                            .padding(.top, 8)
                    } else if let errorMessage = tabelleViewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                    } else {
                        ForEach(tabelleViewModel.tableEntries.indices, id: \.self) { index in
                            TabelleRowView(tableEntry: tabelleViewModel.tableEntries[index], position: index + 1)
                            
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 8)
                
            }
            .onAppear {
                Task {
                    await tabelleViewModel.getTable()
                }
            }
        }
    }
}

struct TabelleView_Previews: PreviewProvider {
    static var previews: some View {
        TabelleView(tabelleViewModel: TabelleViewModel(mannschaft: Mannschaft(id: "1", name: "1. Herren Mannschaft", image: "photo", leagueShortcut: "KLST2H1", leagueSeason: 2024, leagueId: 4768, teamId: 6311)))
    }
}

