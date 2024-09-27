//
//  ImpressumView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 04.09.24.
//

import SwiftUI

struct ImpressumView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                ScrollView{
                    ImpressumHilfsView()
                }
            }
            .navigationTitle("Impressum")
        }
    }
}
#Preview {
    ImpressumView()
}
