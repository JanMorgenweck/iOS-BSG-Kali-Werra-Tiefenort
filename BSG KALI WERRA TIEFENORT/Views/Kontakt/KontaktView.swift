//
//  KontaktView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 04.09.24.
//

import SwiftUI
import MapKit


struct KontaktView: View {
    
    @StateObject private var viewModel = KontaktViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                ScrollView{
                    VStack(alignment: .leading){
                        Text(LocalizedStringKey("Anliegen"))
                            .font(.headline)
                            .padding(.vertical)
                        
                        EmailAdressView()
                        MapView(viewModel: viewModel)
                        TrainTravelView()
                    }
                    
                }
                .scrollIndicators(.never)
                .padding(.horizontal)
            }
        }
        .navigationTitle("Kontakt")
    }
}

#Preview {
    KontaktView()
}
