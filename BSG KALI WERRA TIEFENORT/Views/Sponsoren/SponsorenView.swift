//
//  SponsorenView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 31.07.24.
//

import SwiftUI
import MessageUI


struct SponsorenView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var message = ""
    @State private var isChecked: Bool = false
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
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("wirBedankenUns"))
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text("Hauptsponsor")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        SponsorenImageView(image: "GEWOG")
                            .padding()
                        
                        
                        Text("Premium-Sponsoren")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack{
                            
                            SponsorenImageView(image: "Spedition-Krug")
                            Spacer()
                            SponsorenImageView(image: "Beck-Elektrogrosshandel")
                            Spacer()
                            SponsorenImageView(image: "MSN-Rechtsanwaltsgesellschaft")
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            
                            SponsorenImageView(image: "Krug-Iffland")
                            Spacer()
                            SponsorenImageView(image: "Simon-Autohaus")
                            Spacer()
                            SponsorenImageView(image: "LVM-Katja-Krause")
                        }
                        .padding(.horizontal)
                        
                        SponsorenImageView(image: "Carunion")
                            .padding(.horizontal)
                        
                        Text("Offizelle Partner")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack{
                            
                            SponsorenImageView(image: "Fahrrad-Eyring")
                            Spacer()
                            SponsorenImageView(image: "TEAG")
                            Spacer()
                            SponsorenImageView(image: "Technicum")
                        }
                        .padding(.horizontal)
                        
                        SponsorenImageView(image: "Schmiede-Hill")
                            .padding(.horizontal)
                        
                        Text("Web-Sponsoren")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack{
                            
                            SponsorenImageView(image: "Walnusshof")
                            Spacer()
                            SponsorenImageView(image: "Landhandel-Leimbach")
                            Spacer()
                            SponsorenImageView(image: "Physiotherapie-Wilhelm")
                        }
                        .padding(.horizontal)
                        
                        Text("Bandenwerbung")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack{
                            
                            SponsorenImageView(image: "Fleischerei-Adler")
                            Spacer()
                            SponsorenImageView(image: "Fleischerei-Pfau")
                            Spacer()
                            SponsorenImageView(image: "Groundblogging")
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            
                            SponsorenImageView(image: "Komposta")
                            Spacer()
                            SponsorenImageView(image: "Lehmann-Motorgeraete")
                            Spacer()
                            SponsorenImageView(image: "Maler-Linss")
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            
                            SponsorenImageView(image: "Müller-Heizung-Sanitaer")
                            Spacer()
                            SponsorenImageView(image: "Rexroth-Podologie")
                            Spacer()
                            SponsorenImageView(image: "Rebo-Consult")
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            
                            SponsorenImageView(image: "Tiefbau-Tiefenort")
                            Spacer()
                            SponsorenImageView(image: "VR_Bank")
                            Spacer()
                            SponsorenImageView(image: "Carunion-Primus")
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            
                            SponsorenImageView(image: "Elektro-Hossfeld")
                            Spacer()
                            SponsorenImageView(image: "Rhoener-Eismanufaktur-768x576")
                            Spacer()
                            SponsorenImageView(image: "Flamingo-Doener-768x576")
                        }
                        .padding(.horizontal)
                        
                        SponsorenImageView(image:"Vi-Tva-Sports")
                            .padding(.horizontal)
                        
                        Text("Förderer")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack {
                            
                            SponsorenImageView(image: "Autohaus-Breitungen")
                            Spacer()
                            SponsorenImageView(image: "Bosporus")
                            Spacer()
                            SponsorenImageView(image: "Gasthaus-Zur-Erholung")
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            SponsorenImageView(image: "Geruestverleih-Scheel")
                            Spacer()
                            SponsorenImageView(image: "Alternative-Energien")
                        }
                        .padding(.horizontal)
                        
                        Text("Ausrüster")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack {
                            SponsorenImageView(image: "Intersport-Sauer")
                            Spacer()
                            SponsorenImageView(image: "Jako")
                        }
                        .padding(.horizontal)
                        
                        Text(LocalizedStringKey("sieSuchen"))
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text(LocalizedStringKey("dannSindSie"))
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            
                        Image("Bild-Groundblogging-x-Miss-Germany")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                        
                            Section("") {
                                TextField("Name", text: $name)
                                    .padding(.horizontal)
                                TextField("Email", text: $email)
                                    .textInputAutocapitalization(.never)
                                    .padding(.horizontal)
                                TextField("Telefon", text: $phone)
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
                    }
                }
            }
        }
        .navigationTitle("Sponsoren & Partner")
        .sheet(isPresented: $showingMailView) {
            if MFMailComposeViewController.canSendMail() {
                MailView(name: name, email: email, phone: phone, message: message, isChecked: isChecked, isShowingMailView: $showingMailView)
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
    SponsorenView()
}
