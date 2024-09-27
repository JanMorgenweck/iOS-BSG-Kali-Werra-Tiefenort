//
//  UeberUnsAsyncImage.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 23.08.24.
//

import SwiftUI

struct UeberUnsAsyncImage: View {
    
    let imageUrl: String
    
    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .clipped()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .clipped()
            }
        }
    }
}

#Preview {
    UeberUnsAsyncImage(imageUrl: "")
}
