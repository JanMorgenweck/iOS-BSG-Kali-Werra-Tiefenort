//
//  MapView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//
import SwiftUI
import _MapKit_SwiftUI

struct MapView: View {
    
    @ObservedObject var viewModel: KontaktViewModel
    @Environment(\.openURL) var openURL
    
    var body: some View {
        HStack {
            Text("Anfahrt:")
                .font(.headline)
                .padding()
            Spacer()
            Button(action: {
                let latitude = viewModel.place.location.latitude
                let longitude = viewModel.place.location.longitude
                let url = URL(string: "http://maps.apple.com/?ll=\(latitude),\(longitude)")!
                openURL(url) // Open the URL in Apple Maps
            }) {
                Text("In Apple Karten öffnen")
            }
            .buttonStyle()
            .padding()
        }
       
        
        Map(position: $viewModel.camera) {
            
            Annotation(viewModel.place.title,coordinate: viewModel.place.location) {
                
                Image(systemName: "mappin.circle.fill")
                    .font(.title)
                    .foregroundStyle(.blue)
                
            }
        }
        .frame(height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.bottom)
        
        HStack {
            Text("Mit dem Auto:")
                .font(.headline)
            + Text("Kaffeetälchen 3, 36469 Tiefenort | Parken i.d.R. direkt im Waldstadion Kaffeetälchen möglich, ansonsten im unteren Teil der Waldstraße. ")
        }
        .padding(.vertical)
        
            
    }
}
