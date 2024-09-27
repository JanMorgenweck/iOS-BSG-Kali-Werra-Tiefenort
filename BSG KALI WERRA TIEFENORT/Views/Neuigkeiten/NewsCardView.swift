//
//  NewsCardView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 21.08.24.
//

import SwiftUI

struct NewsCardView: View {
    
    let news: News
    @State private var isExpanded = false
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State var zeilenumbruch: ZeilenUmbruch
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: news.date) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: date)
        }
        return news.date
    }
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 16) {
            if let url = URL(string: news.image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                }
            }
            
            Text(news.header)
                .font(.title)
                .bold()
                .italic()
                .multilineTextAlignment(.center)
            
            Text(formattedDate)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            
            Text("").formatText(text: isExpanded ? news.text : news.shorttext, satzende: zeilenumbruch)
                .font(.body)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .onTapGesture {
                    isExpanded.toggle()
                }
            
            if let linkText = news.linktext, let linkURLString = news.link, let url = URL(string: linkURLString) {
                Link(linkText, destination: url)
                    .font(.body)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.center)
            }
            
            
            if !news.images.isEmpty {
                if let currentImageUrl = URL(string: news.images[currentImageIndex]) {
                    AsyncImage(url: currentImageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .clipped()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .clipped()
                    }
                    .onAppear {
                        startImageRotation()
                    }
                    .onDisappear {
                        stopImageRotation()
                    }
                }
            }
        }
        .padding()
        .background(Color.clear)
    }
    
    private func startImageRotation() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            currentImageIndex = (currentImageIndex + 1) % news.images.count
        }
    }
    private func stopImageRotation() {
        timer?.invalidate()
        timer = nil
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News(image: "https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen03-scaled-e1724134197456-768x767.jpg", header: "KALI WERRA UNTERLIEGT IM ERSTEN HEIMSPIEL", date: "2024-08-20", shorttext: "“Wer 1:0 führt, der stets verliert!” Diese mit Blick auf ihren statistischen Wahrheitsgehalt durchaus anzuzweifelnde altbekannte Fußballerweisheit stimmt zwar nur selten, aber immer dann, wenn sie zutrifft, ist es für", text: "“Wer 1:0 führt, der stets verliert!” Diese mit Blick auf ihren statistischen Wahrheitsgehalt durchaus anzuzweifelnde altbekannte Fußballerweisheit stimmt zwar nur selten, aber immer dann, wenn sie zutrifft, ist es für die eine Mannschaft doof, für die andere eher nicht so. Diesmal waren wir die Doofen. Unsere 1. Mannschaft startete am Sonntag gut in ihre Liga-Partie gegen den FSV 1968 Behringen e.V. und erzielte nach acht Spielminuten mit der ersten nennenswerten Chance das 1:0. Kevin Naumann zog von halbrechts platziert ab und der Ball landete exakt dort, wo er hin sollte. Juhu, unsere erste Führung in der noch jungen Saison hatte soeben das Licht der Welt erblickt! Und der glückliche Stolz frischgebackener Eltern beim Anblick ihres rosigen Nachwuchses erfüllte für einen Moment die strahlenden Gesichter aller Schwarz-Gelben im weiten Rund.In der Folge erspielte sich die beflügelte Kali-Elf weitere gute Möglichkeiten, die eigentlich zum Ausbau der Führung hätten genutzt werden dürfen. Aber mit dem Wörtchen “hätten” werden wir die Welt nicht retten, stattdessen passierte das: Unsere Gäste aus Behringen erzielten in der 35. Minute den 1:1-Ausgleich und kamen nun ihrerseits zu Chancen, welche die Kali-Defensive um den jungen Jannik Sinn, der eine starke Leistung bot, zunächst entschärfen konnte. Zu Beginn von Durchgang zwei nahmen sich die Kali-Jungs die Halbzeitansprache von Trainer Jörg Sauerbrei zu Herzen und agierten wieder aktiver. Leider wollte in dieser hoffnungsfrohen Phase der Ball aber partout kein zweites Mal im gegnerischen Tor einschlagen. Mit zunehmender Spielzeit prägten dann einfache Fehler das Tiefenorter Aufbauspiel, was die Gäste ausnutzten und das Spiel nach 68. Minuten auf 1:2 drehten. Kali Werra gelang trotz stetigen Bemühens keine erneute Trendwende, und in der 83. Minute markierten die Behringer per Freistoß den 1:3-Endstand. Sehr zur Freude ihrer mitgereisten Fans, die während der 90 Minuten für tolle Fußballstimmung gesorgt hatten.Etwas bedröppelt – und zwar nicht wegen des Regens – verließ die Heimelf den Platz. Aber aller guten Dinge sind bekanntlich…?!! Wir sind jedenfalls gespannt auf Spieltag Nummer 3.", linktext: "Hier klicken um das Tor anzusehen!", link: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Videos%2FWhatsApp%20Video%202024-06-02%20at%2017.19.24.mp4?alt=media&token=bc207a76-65e5-4e5c-8016-67eca3ab79be", images: ["https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen01-1024x683.jpg", "https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen03-1024x653.jpg", "https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen04-1024x722.jpg", "https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen02-1024x683.jpg", "https://kali-werra.de/wp-content/uploads/2024/08/KaliWerra-Behringen05-1024x683.jpg"]), zeilenumbruch: .punkt)
    }
}
