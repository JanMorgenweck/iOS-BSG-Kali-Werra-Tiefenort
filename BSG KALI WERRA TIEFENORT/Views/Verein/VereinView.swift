//
//  VereinView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 31.07.24.
//

import SwiftUI
import MessageUI

struct VereinView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isChecked = false
    @State private var showingMailView = false
    @State var showSheet = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                ScrollView{
                    Text("Glück Auf, Vereinmitglieder und Sportkameraden!")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(LocalizedStringKey("aufDieserSeite"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Section("") {
                        TextField("Name", text: $name)
                            .padding(.horizontal)
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .padding(.horizontal)
                        TextField("Nachricht", text: $message)
                            .padding(.horizontal)
                    }
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                    HStack {
                        
                        Image(systemName: isChecked ? "checkmark.square" : "square" )
                            .onTapGesture {
                                isChecked.toggle()
                            }
                        Text(LocalizedStringKey("Datenschutzhinweis"))
                            .font(.footnote)
                            .underline()
                            .onTapGesture {
                                showSheet.toggle()
                            }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            if isChecked {
                                showingMailView = true
                            }
                        }) {
                            Text("Senden")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(8)
                                .background(.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Image("Logo-BSG-Kali-Werra")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipped()
                        NavigationLink("Unterstütze den Verein und werde Mitgliedin unseren Verein", destination: MitgliedWerdenView())
                            .font(.title3)
                            .foregroundStyle(.black)
                        
                    }
                    .background(.yellow)
                    .padding(.horizontal)
                    
                    NavigationLink("Offene ehrenamtliche Stellen im Verein", destination: EhrenamtlicheStellenView())
                        .font(.title3)
                        .padding(8)
                        .background(.yellow)
                        .foregroundStyle(.black)
                        .padding()
                    
                    if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Stadionordnung.jpg?alt=media&token=a0ab8cc4-0549-47e9-9b54-5646cbb030fe") {
                        Link(destination: URL(string: "https://kali-werra.de/wp-content/uploads/2023/06/Stadionordnung-Waldstadion-Kaffeetaelchen.pdf")!) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                    .clipped()
                                    .padding()
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                    .clipped()
                                    .padding()
                            }
                        }
                    }
                    if let videoURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Videos%2F1715438602394.mp4?alt=media&token=568da80e-9697-41c7-918c-16a374732b8e") {
                        VideoPlayerView(url: videoURL)
                            .frame(width: 350)
                    } else {
                        Text("Invalid video URL")
                            .foregroundStyle(.red)
                            .padding()
                    }
                }
            }
        }
        .navigationTitle("Verein")
        .sheet(isPresented: $showingMailView) {
            if MFMailComposeViewController.canSendMail() {
                VereinMailView(name: name, email: email, message: message, isChecked: isChecked, isShowingMailView: $showingMailView)
            } else {
                Text("Maildienste sind auf diesem Gerät nicht verfügbar.")
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack{
                DatenschutzView()
                Spacer()
                Button(action: {
                    showSheet = false
                }) {
                    Text("Schließen")
                }
                .buttonStyle()
            }
        }
    }
}

#Preview {
    VereinView()
}
