//
//  MitgliedWerdenMailView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 26.08.24.
//

import SwiftUI
import MessageUI

struct MitgliedWerdenMailView: UIViewControllerRepresentable {
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MitgliedWerdenMailView
        
        init(parent: MitgliedWerdenMailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
            controller.dismiss(animated: true) {
                self.parent.isShowingMailView = false
            }
        }
    }
    var firstName: String
    var name: String
    var birthday: Date
    var street: String
    var houseNumber: String
    var zipCode: String
    var city: String
    var job: String
    var selectedTeam: Teams
    var phone: String
    var email: String
    var iban: String
    var bic: String
    var accountHolder: String
    var hasReadTerms: Bool
    var agreesToDirectDebit: Bool
    var agreesToDataPublishing: Bool
    var agreesToPrivacyPolicy: Bool
    @Binding var isShowingMailView: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = context.coordinator
        if MFMailComposeViewController.canSendMail() {
            mailComposeVC.setToRecipients(["janmorgenweck@hotmail.com"])
            mailComposeVC.setSubject("Neue Mitgliedsanfrage von \(firstName) \(name)")
            
            let messageBody = """
                        Mitgliedsantrag:
                        
                        Vorname: \(firstName)
                        Name: \(name)
                        Geburtsdatum: \(birthday.formatted(date: .long, time: .omitted))
                        Straße: \(street)
                        Hausnummer: \(houseNumber)
                        Postleitzahl: \(zipCode)
                        Wohnort: \(city)
                        Beruf: \(job)
                        Mannschaft: \(selectedTeam.rawValue)
                        Telefon: \(phone)
                        Email: \(email)
                        IBAN: \(iban)
                        BIC: \(bic)
                        Kontoinhaber: \(accountHolder)
                        
                        Zustimmungserklärungen:
                        - Bedingungen gelesen und akzeptiert: \(hasReadTerms ? "Ja" : "Nein")
                        - Einzugsermächtigung erteilt: \(agreesToDirectDebit ? "Ja" : "Nein")
                        - Zustimmung zur Datenveröffentlichung: \(agreesToDataPublishing ? "Ja" : "Nein")
                        - Datenschutzerklärung gelesen und akzeptiert: \(agreesToPrivacyPolicy ? "Ja" : "Nein")
                        """
            
            mailComposeVC.setMessageBody(messageBody, isHTML: false)
        }
        return mailComposeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}

