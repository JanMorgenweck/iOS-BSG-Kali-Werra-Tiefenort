//
//  FullScreenImageView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 23.08.24.
//

import SwiftUI

struct FullScreenImageView: View {
    
    let imageUrl: String
    
    var body: some View {
        NavigationStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                    .resizable()
                    .scaledToFit()
                    .padding()
            } placeholder: {
                ProgressView()
            }
            .background(.black)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    FullScreenImageView(imageUrl: "https://kali-werra.de/wp-content/uploads/2022/09/Bild15-Kopie.jpeg")
}
