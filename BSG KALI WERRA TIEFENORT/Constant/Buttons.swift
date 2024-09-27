//
//  Buttons.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 23.08.24.
//

import Foundation
import SwiftUI

extension Button {
    func buttonStyle() -> some View {
        self
            .foregroundStyle(.black)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8)
            )
            .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 0.5)
            )
            .shadow(color: .black, radius: 2)
    }
    
    
}
