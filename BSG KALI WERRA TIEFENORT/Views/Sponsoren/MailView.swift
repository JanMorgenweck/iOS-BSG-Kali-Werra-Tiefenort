//
//  MailView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 22.08.24.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
            controller.dismiss(animated: true) {
                self.parent.isShowingMailView = false
            }
        }
    }
    
    var name: String
    var email: String
    var phone: String
    var message: String
    var isChecked: Bool
    @Binding var isShowingMailView: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = context.coordinator
        if MFMailComposeViewController.canSendMail() {
            mailComposeVC.setToRecipients(["janmorgenweck@hotmail.com"])
            mailComposeVC.setSubject("Neue Anfrage von \(name)")
            mailComposeVC.setMessageBody("Name: \(name)\nEmail: \(email)\nTelefon: \(phone)\nNachricht: \(message)\nDatenschutzerklärung gelesen und akzeptiert: \(isChecked ? "Ja" : "Nein")", isHTML: false)
        }
        return mailComposeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}
