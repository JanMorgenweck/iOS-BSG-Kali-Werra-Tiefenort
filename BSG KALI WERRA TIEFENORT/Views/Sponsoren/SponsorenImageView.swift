//
//  SponsorenImageView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 22.08.24.
//

import SwiftUI

struct SponsorenImageView: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipped()
            }
        }
