//
//  DatenschutzView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 04.09.24.
//

import SwiftUI

struct DatenschutzView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                ScrollView{
                    VStack(alignment: .leading) {
                        Text("Datenschutzerklärung")
                            .font(.title)
                            .padding(.vertical)
                        Text(LocalizedStringKey("1"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("1.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("1.2"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("1.3"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("2"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("2.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("3"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("3.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("4"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("4.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("5"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("5.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("6"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("6.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("6.2"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("7"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("7.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("8"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("8.1"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("8.2"))
                            .padding(.bottom)
                        Text(LocalizedStringKey("9"))
                            .font(.headline)
                            .padding(.bottom)
                        Text(LocalizedStringKey("9.1"))
                            .padding(.bottom)
                    }
                    .padding()
                }
            }
            .navigationTitle("Datenschutz")
        }
    }
}

#Preview {
    DatenschutzView()
}
