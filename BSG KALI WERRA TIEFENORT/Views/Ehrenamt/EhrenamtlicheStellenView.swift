//
//  EhrenamtlicheStellenView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 26.08.24.
//

import SwiftUI
import MessageUI

struct EhrenamtlicheStellenView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var job = ""
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
                ScrollView {
                    Text(LocalizedStringKey("einFussballverein"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Section("") {
                        TextField("Name", text: $name)
                            .padding(.horizontal)
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .padding(.horizontal)
                        TextField("Tätigkeit", text: $job)
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
                    
                    Text("Schiedsrichter (M,W,D)")
                        .font(.title2)
                        .bold()
                    Text(LocalizedStringKey("schiedrichter"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .bottom])
                    
                    Text("Trainer (M,W,D)")
                        .font(.title2)
                        .bold()
                    Text(LocalizedStringKey("Trainer"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .bottom])
                    
                    Text("Platzwart (M,W,D)")
                        .font(.title2)
                        .bold()
                    Text(LocalizedStringKey("platzwart"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .bottom])
                    
                    Text("Technischer Leiter (M,W,D)")
                        .font(.title2)
                        .bold()
                    Text(LocalizedStringKey("technischerLeiter"))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .bottom])
                }
            }
        }
        .navigationTitle("Ehrenamtlich Stellen")
        .sheet(isPresented: $showingMailView) {
            if MFMailComposeViewController.canSendMail() {
                EhrenamtMailView(name: name, email: email, job: job, message: message, isChecked: isChecked, isShowingMailView: $showingMailView
                )
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
    EhrenamtlicheStellenView()
}
