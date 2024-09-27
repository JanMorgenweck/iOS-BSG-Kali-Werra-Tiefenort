//
//  MitgliedWerdenView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 26.08.24.
//

import SwiftUI
import MessageUI

struct MitgliedWerdenView: View {
    @State private var firstName = ""
    @State private var name = ""
    @State private var birthday = Date()
    @State private var street = ""
    @State private var houseNumber = ""
    @State private var zipCode = ""
    @State private var city = ""
    @State private var job = ""
    @State private var selectedTeam: Teams = .gJunioren
    @State private var phone = ""
    @State private var email = ""
    @State private var iban = ""
    @State private var bic = ""
    @State private var accountHolder = ""
    @State private var hasReadTerms = false
    @State private var agreesToDirectDebit = false
    @State private var agreesToDataPublishing = false
    @State private var agreesToPrivacyPolicy = false
    @State private var showingMailView = false
    @State var showSheet = false
    
    private var canSubmit: Bool {
        hasReadTerms && agreesToDirectDebit && agreesToDataPublishing && agreesToPrivacyPolicy
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                Text("Werde ein Teil von Kali Werra!")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Form {
                    Section(header: Text("Online-Mitgliedsantrag")) {
                        TextField("Vorname", text: $firstName)
                        TextField("Name", text: $name)
                        DatePicker("Geburtsdatum", selection: $birthday, displayedComponents: .date)
                        TextField("Straße", text: $street)
                        TextField("Hausnummer", text: $houseNumber)
                            .keyboardType(.numberPad)
                        TextField("Postleitzahl", text: $zipCode)
                            .keyboardType(.numberPad)
                        TextField("Wohnort", text: $city)
                        TextField("Beruf", text: $job)
                        Picker("Mannschaft", selection: $selectedTeam) {
                            ForEach(Teams.allCases) { team in
                                Text(team.rawValue).tag(team)
                            }
                        }
                        TextField("Telefon", text: $phone)
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                        TextField("IBAN", text: $iban)
                        TextField("BIC", text: $bic)
                        TextField("Kontoinhaber", text: $accountHolder)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Toggle(isOn: $hasReadTerms) {
                                Text(LocalizedStringKey("Mitgliedsbekundung"))
                                    .font(.footnote)
                            }
                            Toggle(isOn: $agreesToDirectDebit) {
                                Text(LocalizedStringKey("Beitragseinzug"))
                                    .font(.footnote)
                            }
                            Toggle(isOn: $agreesToDataPublishing) {
                                Text(LocalizedStringKey("EinwilligungPersonendaten"))
                                    .font(.footnote)
                            }
                            Toggle(isOn: $agreesToPrivacyPolicy) {
                                Text(LocalizedStringKey("Datenschutzhinweis"))
                                    .font(.footnote)
                                    .underline()
                                    .onTapGesture {
                                        showSheet.toggle()
                                    }
                            }
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                if canSubmit {
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
                            .disabled(!canSubmit)
                        }
                    }
                    
                    Text(LocalizedStringKey("umAktuvAmSpielbetrieb"))
                        .font(.footnote)
                        .padding(.top, 8)
                    Link("Antrag auf Spielerlaubnis", destination: URL(string: "https://kali-werra.de/wp-content/uploads/2022/09/Antrag_auf_Erteilung_Spielerlaubnis.pdf")!)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .padding(.top,4)
                    
                    Text("Die aktuellen Beitragssätze unserer Mitglieder")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Aktive Mitglieder")
                        .font(.subheadline)
                        .bold()
                    Text("48,00 € pro Jahr")
                        .font(.footnote)
                    Spacer()
                    Text("Aktive Mitglieder (jünger als 18 Jahre, Schüler, Studenten, Auszubildende, Rentner")
                        .font(.subheadline)
                        .bold()
                    Text("36,00€ pro Jahr")
                        .font(.footnote)
                    Spacer()
                    Text("Nicht aktive Mitglieder")
                        .font(.subheadline)
                        .bold()
                    Text("36,00€ pro Jahr")
                        .font(.footnote)
                }
            }
            .padding()
            .sheet(isPresented: $showingMailView) {
                if MFMailComposeViewController.canSendMail() {
                    MitgliedWerdenMailView(
                        firstName: firstName,
                        name: name,
                        birthday: birthday,
                        street: street,
                        houseNumber: houseNumber,
                        zipCode: zipCode,
                        city: city,
                        job: job,
                        selectedTeam: selectedTeam,
                        phone: phone,
                        email: email,
                        iban: iban,
                        bic: bic,
                        accountHolder: accountHolder,
                        hasReadTerms: hasReadTerms,
                        agreesToDirectDebit: agreesToDirectDebit,
                        agreesToDataPublishing: agreesToDataPublishing,
                        agreesToPrivacyPolicy: agreesToPrivacyPolicy,
                        isShowingMailView: $showingMailView
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
}

#Preview {
    MitgliedWerdenView()
}
