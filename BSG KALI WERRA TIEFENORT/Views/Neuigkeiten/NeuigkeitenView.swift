//
//  NeuigkeitenView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 31.07.24.
//

import SwiftUI

struct NeuigkeitenView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                VStack {
                    if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                            .padding()
                    } else if viewModel.news.isEmpty {
                        Text("Keine Neuigkeiten verfügbar")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List(viewModel.news) { newsItem in
                            NewsCardView(news: newsItem, zeilenumbruch: .punkt)
                        }
                    }
                }
                
                .navigationTitle("Neuigkeiten")
                .task {
                    await viewModel.fetchNews()
                }
            }
        }
    }
}
struct NeuigkeitenView_Previews: PreviewProvider {
    static var previews: some View {
        NeuigkeitenView()
    }
}
