//
//  TabelleRowView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 03.09.24.
//

import SwiftUI

struct TabelleRowView: View {
    
    let tableEntry: TableEntry
    let position: Int
    
    var body: some View {
        HStack(spacing: 10) {
            Text("\(position)")
                .frame(width: 20)
                .multilineTextAlignment(.center)
            
            if let url = URL(string: tableEntry.teamIconUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
            }
            
            Text(tableEntry.teamName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .truncationMode(.tail)
            
            
            
            Text("\(tableEntry.matches)")
                .frame(width: 25)
                .multilineTextAlignment(.center)
            
            Text("\(tableEntry.won)")
                .frame(width: 25)
                .multilineTextAlignment(.center)
            
            Text("\(tableEntry.draw)")
                .frame(width: 25)
                .multilineTextAlignment(.center)
            
            Text("\(tableEntry.lost)")
                .frame(width: 25)
                .multilineTextAlignment(.center)
            
            Text("\(tableEntry.points)")
                .frame(width: 25)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
        }
        .padding(.vertical, 5)
    }
}
