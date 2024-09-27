//
//  TrainTravelView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//

import SwiftUI

struct TrainTravelView: View {
    var body: some View {
        Image("Von-der-Bahn-ins-Kaffeetaelchen")
                      .resizable()
                      .scaledToFit()
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                      .clipped()
                      .clipShape(RoundedRectangle(cornerRadius: 10))

          
          HStack{
              Text("Mit der Bahn:")
                  .font(.headline)
              + Text("Süd-Thüringen-Bahn bis zur Haltestelle Oberrohn, danach zu Fuß ungefähr 45 Minuten (Strecke: circa 3 km) über den Wald-Wanderweg.")
          }
          .padding(.vertical)
    }
}


