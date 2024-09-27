//
//  Mannschaft.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 27.08.24.
//

import Foundation
import FirebaseFirestore

struct Mannschaft: Identifiable, Codable {
    var id: String
    var name: String
    var image: String
    var info: String?
    var email: String?
    var fbde: String?
    var link: String?
    var leagueShortcut: String?
    var leagueSeason: Int?
    var leagueId: Int?
    var teamId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case info
        case email
        case fbde
        case link
        case leagueShortcut
        case leagueSeason
        case leagueId
        case teamId
    }
}

class DataSource {
    func loadMannschaften() -> [Mannschaft] {
        let mannschaften = [
            Mannschaft(
                id: "01",
                name: "1.Herren Mannschaft",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-22-23_web-1536x1066.jpg?alt=media&token=139e41a8-6887-457e-bd9f-39c79f13e48f",
                info:"""
                Trainingszeiten:
                
                Dienstag: 
                18:30 Uhr bis 20:00 Uhr | Waldstadion Kaffeetälchen
                
                Freitag: 
                18:30 Uhr bis 20:00 Uhr | Waldstadion Kaffeetälchen
                
                Ansprechpartner: 
                Jörg Sauerbrei
                """,
                email: "sport@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/kreisliga-staffel-2-kreis-westthueringen-kreisliga-herren-saison2425-thueringen/-/staffel/02Q252LM78000008VS5489B4VVGB4UUN-G#!/",
                leagueShortcut: "1HKLST2",
                leagueSeason: 2024,
                leagueId: 4768,
                teamId: 6311
            ),
            Mannschaft(
                id: "02",
                name: "2. Herren Mannschaft",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2F2.-Mannschaft.jpg?alt=media&token=bec5c8e3-3d74-4fb7-8305-cc2758a15643",
                info: """
                            Trainingszeiten:
                            
                            Dienstag: 
                            18:30 Uhr bis 20:00 Uhr | Sportplatz Frauensee
                            
                            Freitag: 
                            18:30 Uhr bis 20:00 Uhr | Sportplatz Frauensee
                            
                            Ansprechpartner: 
                            Pierre Cravaack
                            """,
                email: "kali-werra-tiefenort@outlook.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/1-kreisklasse-staffel-2-kreis-westthueringen-1kreisklasse-herren-saison2425-thueringen/-/staffel/02Q27GD85S000008VS5489B4VVGB4UUN-G#!/",
                leagueShortcut: "1KKHST2",
                leagueSeason: 2024,
                leagueId: 4771,
                teamId: 6475
            ),
            Mannschaft(
                id: "03",
                name: "Edle Herren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FAlte-Herren.jpg?alt=media&token=96c16c67-66ea-43a6-971d-27b91f2aa885",
                info: """
                            Trainingszeiten:
                            
                            Mittwoch: 
                            18:30 Uhr bis 20:00 Uhr | Waldstadion Kaffeetälchen
                            
                            Ansprechpartner: 
                            Jörg Ebert
                            """,
                email: "kali-werra-tiefenort@outlook.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/kreisliga-ah-ue35-staffel-1-kreis-westthueringen-herren-ue35-kreisliga-herren-ue35-saison2425-thueringen/-/staffel/02Q2PCPKVS000007VS5489B3VVLDQQH4-G#!/",
                leagueShortcut: "KLAHST1",
                leagueSeason: 2024,
                leagueId: 4770,
                teamId: 6311
            ),
            Mannschaft(
                id: "04",
                name: "A - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-A-Junioren.jpg?alt=media&token=ea982d1b-4ff9-4068-817c-b1ca2d0c8778",
                info: """
                        Trainingszeiten:
                                        
                        Montag: 
                        18:30 Uhr bis 20:00 Uhr | Sportplatz Frauensee
                                        
                        Mittwoch: 
                        18:30 Uhr bis 20:00 Uhr | Sportplatz Frauensee
                                        
                        Ansprechpartner: 
                        Florian Scholz, Steffen Domann
                        """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/a-junioren-kol-kreis-westthueringen-a-junioren-kreisoberliga-a-junioren-saison2425-thueringen/-/staffel/02Q4QVKRAO000004VS5489B3VUHDH0E9-G#!/",
                leagueShortcut: "KOLAJ",
                leagueSeason: 2024,
                leagueId: 4772,
                teamId: 6311
            ),
            Mannschaft(
                id: "05",
                name: "B - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-B-Junioren2-1536x1066.jpg?alt=media&token=9d87e0cf-0abe-4025-bc88-1234a448e3ba",
                info: """
                            Trainingszeiten:
                            
                            Montag: 
                            17:30 Uhr bis 19:00 Uhr | Waldstadion Kaffeetälchen
                            
                            Mittwoch: 
                            17:30 Uhr bis 19:00 Uhr | Sportplatz Kieselbach
                            
                            Ansprechpartner: 
                            Robert Langer, Enrico Wagner
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/b-junioren-kol-kreis-westthueringen-b-junioren-kreisoberliga-b-junioren-saison2425-thueringen/-/staffel/02Q4VJJEDG000004VS5489B3VUHDH0E9-G#!/",
                leagueShortcut: "KOLWTBJ",
                leagueSeason: 2024,
                leagueId: 4773,
                teamId: 6311
            ),
            Mannschaft(
                id: "06",
                name: "C1 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-C-Junioren-1536x1066.jpg?alt=media&token=57a122bf-5dd5-40b4-adea-3ef6c60a81c3",
                info: """
                            Trainingszeiten:
                            
                            Mittwoch: 
                            17:00 Uhr bis 18:30 Uhr | Waldstadion Kaffeetälchen
                            
                            Freitag: 
                            17:00 Uhr bis 18:30 Uhr | Sportplatz Frauensee
                            
                            Ansprechpartner: 
                            Mathias Wenig, Florian Krug, Marcus Noback, Tobias Wilhelm
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/landesklasse-st-2-thueringen-c-junioren-landesklasse-c-junioren-saison2425-thueringen/-/staffel/02PUBONJ7G000004VS5489B4VVTKJJ35-G#!/",
                leagueShortcut: "LKST2CJ",
                leagueSeason: 2024,
                leagueId: 4774,
                teamId: 6311
            ),
            Mannschaft(
                id: "07",
                name: "C2 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-C2-Junioren.jpg?alt=media&token=e0bf0703-fe1f-45cb-8625-50100809e5cb",
                info: """
                            Trainingszeiten:
                            
                            Mittwoch: 
                            16:00 Uhr bis 17:30 Uhr | Sportplatz Kieselbach
                            
                            Freitag: 
                            16:00 Uhr bis 17:30 Uhr | Sportplatz Kieselbach
                            
                            Ansprechpartner: 
                            Tino Vollmer, Jan Morgenweck
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/c-junioren-kreisliga-st-1-kreis-westthueringen-c-junioren-kreisliga-c-junioren-saison2425-thueringen/-/staffel/02Q50BJOT4000004VS5489B3VUHDH0E9-G#!/",
                leagueShortcut: "KLWTST2CJ",
                leagueSeason: 2024,
                leagueId: 4775,
                teamId: 6475
            ),
            Mannschaft(
                id: "08",
                name: "D1 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-D1-Junioren-1536x1066.jpg?alt=media&token=bfa69ad5-3fb5-4219-aeeb-644bfca85a14",
                info: """
                            Trainingszeiten:
                            
                            Montag: 
                            16:00 Uhr bis 17:30 Uhr | Sportplatz Frauensee
                            
                            Donnerstag: 
                            15:30 Uhr bis 17:00 Uhr | Sportplatz Kieselbach
                            
                            Ansprechpartner: 
                            David Wohlfahrt, Tobias Hoerschelmann
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/d-junioren-kreisoberliga-kreis-westthueringen-d-junioren-kreisoberliga-d-junioren-saison2425-thueringen/-/staffel/02Q51MJJFO000004VS5489B4VTH92TNV-G#!/",
                leagueShortcut: "KOLDJ",
                leagueSeason: 2024,
                leagueId: 4780,
                teamId: 6311
            ),
            Mannschaft(
                id: "09",
                name: "D2 - Junioren",
                image: "",
                info: """
                            Trainingszeiten:
                            
                            Montag: 
                            17:30 Uhr bis 19:00 Uhr | Sportplatz Kieselbach
                            
                            Donnerstag: 
                            17:30 Uhr bis 19:00 Uhr | Sportplatz Kieselbach
                            
                            Ansprechpartner: 
                            Michael Schulz, Sebastian Happ
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/d-junioren-kreisliga-st1-kreis-westthueringen-d-junioren-kreisliga-d-junioren-saison2425-thueringen/-/staffel/02Q51UA0RC000004VS5489B4VTH92TNV-G#!/",
                leagueShortcut: "KLST1DJ",
                leagueSeason: 2024,
                leagueId: 4781,
                teamId: 6475
            ),
            Mannschaft(
                id: "10",
                name:"D - Juniorinnen",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-D-Juniorinnen.jpg?alt=media&token=a8f4e1ab-da0e-458f-8c2b-5666745609b5",
                info: """
                            Trainingszeiten:
                                    
                            Montag:
                            16:00 Uhr bis 17:30 Uhr | Waldstadtion Kaffeetälchen
                                            
                            Dienstag:
                            17:00 Uhr bis 18:30 Uhr | Sportplatz Kieselbach
                                            
                            Donnerstag:
                            17:00 Uhr bis 18:30 Uhr | Sportplatz Kaltenborn
                                            
                            Ansprechpartner:
                            Norbert Beck, Sebastian Brenn
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde:"Ergebnisse auf FUSSBALL.DE",
                link:"https://www.fussball.de/spieltagsuebersicht/verbandsliga-thueringen-d-juniorinnen-verbandsliga-d-juniorinnen-saison2425-thueringen/-/staffel/02Q1T7KLK0000004VS5489B3VVLDQQH4-G#!/",
                leagueShortcut: "VLDJinnen",
                leagueSeason: 2024,
                leagueId: 4782,
                teamId:6311
                
            ),
            Mannschaft(
                id: "11",
                name:"E1 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-E1-Junioren-1536x1066.jpg?alt=media&token=74c2d956-7d61-4c3d-9b56-5a349dec2073",
                info: """
                            Trainingszeiten:
                                    
                            Dienstag: 
                            17:00 Uhr bis 18:30 Uhr | Sportplatz Frauensee
                                    
                            Donnerstag: 
                            17:00 Uhr bis 18:30 Uhr | Sportplatz Kieselbach
                                    
                            Ansprechpartner: 
                            Thomas Bertz, Christian Fiehler, Andre Nelkert, Franz Josupeit
                            """,
                email: "nachwuchs@kali-werra.de",
                fbde:"Ergebnisse auf FUSSBALL.DE",
                link:"https://www.fussball.de/spieltagsuebersicht/e-junioren-kreisliga-st1-kreis-westthueringen-e-junioren-kreisliga-e-junioren-saison2425-thueringen/-/staffel/02Q5DUO8HC000000VS5489B3VUHDH0E9-G#!/",
                leagueShortcut: "KLEJST1",
                leagueSeason: 2024,
                leagueId: 4783,
                teamId:6311
                
            ),
            Mannschaft(
                id: "12",
                name: "E2 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-F1-Junioren-1536x1066.jpg?alt=media&token=5a6f2008-dc14-4502-87a7-5be3a967316f",
                info: """
                Trainingszeiten:
                
                Montag: 
                17:30 Uhr bis 19:00 Uhr | Sportplatz Kieselbach
                
                Donnerstag: 
                17:30 Uhr bis 19:00 Uhr | Sportplatz Kieselbach
                
                Ansprechpartner: 
                Stefan Munk, Florian Hoffmann, Manfred Munk
                """,
                email:"nachwuchs@kali-werra.de",
                fbde:"Ergebnisse auf FUSSBALL.DE",
                link:"https://www.fussball.de/spieltagsuebersicht/e-junioren-kreisliga-st4-kreis-westthueringen-e-junioren-kreisliga-e-junioren-saison2425-thueringen/-/staffel/02Q5DV2KES000000VS5489B3VUHDH0E9-G#!/",
                leagueShortcut: "KLEJST4",
                leagueSeason: 2024,
                leagueId: 4784,
                teamId: 6475
            ),
            Mannschaft(
                id: "13",
                name: "E - Juniorinnen",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-E-Juniorinnen.jpg?alt=media&token=8bc851ad-bb73-4ef9-992c-c881e3afe13e",
                info: """
                Trainingszeiten:
                
                Montag: 
                16:00 Uhr bis 17:30 Uhr | Waldstadtion Kaffeetälchen
                
                Dienstag: 
                17:00 Uhr bis 18:30 Uhr | Sportplatz Kieselbach
                
                Donnerstag: 
                17:00 Uhr bis 18:30 Uhr | Sportplatz Kaltenborn
                
                Ansprechpartner: 
                Partick Schellenberg, Rene Tschaar
                """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/tfv-turnierserie-e-juniorinnen-2024-2025-thueringen-e-juniorinnen-landesturnier-e-juniorinnen-saison2425-thueringen/-/staffel/02QJ5HU07C000000VS5489B3VUHJP2M3-C#!/",
                leagueShortcut: "",
                leagueSeason: 0,
                leagueId: 0,
                teamId: 0
            ),
            Mannschaft(
                id: "14",
                name: "F1 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-F3-Junioren-1536x1066.jpg?alt=media&token=400ab1bf-3448-4e6b-9159-d6a56203892c",
                info: """
                Trainingszeiten:
                
                Dienstag: 
                16:30 Uhr bis 18:00 Uhr | Waldstadion Kaffeetälchen
                
                Donnerstag: 
                16:30 Uhr bis 18:00 Uhr | Sportplatz Frauensee
                
                Ansprechpartner: 
                Matthias Möller, David Matthä, Frank Reichardt
                """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/mannschaft/fsv-kali-werra-tiefenort-bsg-kali-werra-tiefenort-thueringen/-/saison/1819/team-id/012UNHUJO0000000VV0AG811VVETIMC3#!/",
                leagueShortcut: "",
                leagueSeason: 0,
                leagueId: 0,
                teamId: 0
            ),
            Mannschaft(
                id: "15",
                name: "F2 - Junioren",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-G-Junioren-1536x1066.jpg?alt=media&token=6adafb44-c8da-4b19-9530-5a7ba31b63e9",
                info: """
                Trainingszeiten:
                
                Dienstag: 
                16:30 Uhr bis 18:00 Uhr | Waldstadion Kaffeetälchen
                
                Donnerstag: 
                16:30 Uhr bis 18:00 Uhr | Sportplatz Frauensee
                
                Ansprechpartner: 
                Georg Narbei, Andreas Schramm, Daniel Gerlach, Philipp Narbei
                """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/mannschaft/bsg-kali-werra-tiefenort-ii-bsg-kali-werra-tiefenort-thueringen/-/saison/2425/team-id/02IATVGSV0000000VS5489B2VU2I8R4H#!/",
                leagueShortcut: "",
                leagueSeason: 0,
                leagueId: 0,
                teamId: 0
            ),
            Mannschaft(
                id: "16",
                name: "F - Juniorinnen",
                image: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Mannschaft%2FMannschaftsfoto-E-Juniorinnen.jpg?alt=media&token=8bc851ad-bb73-4ef9-992c-c881e3afe13e",
                info: """
                Trainingszeiten:
                
                Montag: 
                16:00 Uhr bis 17:30 Uhr | Waldstadtion Kaffeetälchen
                
                Dienstag: 
                17:00 Uhr bis 18:30 Uhr | Sportplatz Kieselbach
                
                Donnerstag: 
                17:00 Uhr bis 18:30 Uhr | Sportplatz Kaltenborn
                
                Ansprechpartner: 
                Partick Schellenberg, Rene Tschaar
                """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link: "https://www.fussball.de/spieltagsuebersicht/tfv-turnierserie-e-juniorinnen-2024-2025-thueringen-e-juniorinnen-landesturnier-e-juniorinnen-saison2425-thueringen/-/staffel/02QJ5HU07C000000VS5489B3VUHJP2M3-C#!/",
                leagueShortcut: "",
                leagueSeason: 0,
                leagueId: 0,
                teamId: 0
            ),
            Mannschaft(
                id: "17",
                name:"G - Junioren",
                image:"photo",
                info:"""
                Trainingszeiten:
                
                Mittwoch: 
                16:30 Uhr bis 18:00 Uhr | Sportplatz Frauensee
                
                Ansprechpartner:
                Michael Hessel
                """,
                email: "nachwuchs@kali-werra.de",
                fbde: "Ergebnisse auf FUSSBALL.DE",
                link:"https://www.fussball.de/mannschaft/bsg-kali-werra-tiefenort-bsg-kali-werra-tiefenort-thueringen/-/saison/2425/team-id/023K51PRN8000000VS548984VTFV1I8K#!/",
                leagueShortcut:"",
                leagueSeason:0,
                leagueId:0,
                teamId:0
            )
            
            
        ]
        return mannschaften
    }
}
