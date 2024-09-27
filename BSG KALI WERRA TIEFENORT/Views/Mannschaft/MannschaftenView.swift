//
//  MannschaftenView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 31.07.24.
//

import SwiftUI

@MainActor
struct MannschaftenView: View {
    
    @StateObject private var viewModel = MannschaftenViewModel()
    @State private var isSubTextExpanded = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(LocalizedStringKey("aufDieTradition"))
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                        Text(isSubTextExpanded ? LocalizedStringKey("expandedSubText") : LocalizedStringKey("shortSubText"))
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .onTapGesture {
                                isSubTextExpanded.toggle()
                            }
                        if viewModel.isLoading {
                            ProgressView("Lade Mannschaften...")
                                .padding()
                        } else if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundStyle(.red)
                                .padding()
                        } else {
                            ForEach(viewModel.mannschaften) { mannschaft in
                                NavigationLink(destination: MannschaftDetailView(mannschaft: mannschaft)) {
                                    VStack {
                                        Text(mannschaft.name)
                                            .font(.title2)
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.black)
                                            .fontWeight(.medium)
                                            .padding()
                                        
                                        AsyncImage(url: URL(string: mannschaft.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: .infinity, maxHeight: 250)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .clipped()
                                        } placeholder: {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: .infinity, maxHeight: 250)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .clipped()
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.never)
            .navigationTitle("Mannschaften")
            .onAppear {
                Task {
                    print("Fetching Mannschaften...")
                    await viewModel.fetchMannschaften()
                }
            }
        }
    }
}
#Preview {
    MannschaftenView()
}
