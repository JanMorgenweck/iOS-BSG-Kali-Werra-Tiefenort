//
//  VideosView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 23.08.24.
//

import SwiftUI

struct VideosView: View {
    
    let videos = [
        ("   Fundstück aus 2012", URL(string: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Videos%2FKali%20Werra%20Tiefenort%20-%20Oldiespiel%20zur%20Jahrfeier%202012.mp4?alt=media&token=88d34e52-c334-42ea-9d0e-6122d33d150a")!),
        ("   100 Jahre Kali Werra Tiefenort", URL(string: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Videos%2F110JahreKaliWerra.mp4?alt=media&token=f7692c30-4eb0-4548-b287-7fbe29d730a5")!),
        ("   Ein Hauch von Bundesliga", URL(string: "https://58de7a369a9c4.streamlock.net/vod/_definst_/3q/videos/43/2024/04/a7782d002781ac71d9de259cc165d065bc930d3d.mp4/playlist.m3u8")!)
    ]
    var body: some View {
        VStack {
            Text("Videos")
                .font(.title2)
                .bold()
                .padding()
            ForEach(videos, id: \.1) { video in
                VStack(alignment: .leading) {
                    Text(video.0)
                        .font(.headline)
                        .padding(.bottom, 4)
                    VideoPlayerView(url: video.1)
                }
            }
        }
    }
}

#Preview {
    VideosView()
}
