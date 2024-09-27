//
//  VideoPlayerView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 23.08.24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let url: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
                    .aspectRatio(contentMode: .fit)  // Passen Sie das Video an die Größe an, die Sie möchten
                    .frame(width: 350)  // Anpassen der Größe der Video-Frame
                    .background(Color.black)  // Optional: Hintergrundfarbe hinzufügen
                    .cornerRadius(8)  // Optional: Abgerundete Ecken hinzufügen
                    .padding()
            }
    }

