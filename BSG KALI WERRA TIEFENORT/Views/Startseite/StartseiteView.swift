//
//  StartseiteView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 30.07.24.
//

import SwiftUI

struct StartseiteView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var presentSideMenu: Bool
    @Binding var selectedSideMenuTab: Int
    
    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch selectedSideMenuTab {
                    case 0:
                        HomeView(selectedSideMenuTab: $selectedSideMenuTab)
                        
                    case 1:
                        NeuigkeitenView()
                        
                    case 2:
                        VereinView()
                        
                    case 3:
                        MannschaftenView()
                        
                    case 4:
                        UeberUnsView()
                        
                    case 5:
                        SponsorenView()
                        
                    case 6:
                        ProfileView()
                        
                    case 7:
                        DatenschutzView()
                        
                    case 8:
                        ImpressumView()
                        
                    default:
                        KontaktView()
                    }
                }

                if presentSideMenu {
                    SidebarMenu(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.move(edge: .leading))
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentSideMenu.toggle()
                    }) {
                        Image(systemName:"sidebar.squares.leading")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        selectedSideMenuTab = 0
                    }) {
                        Image(systemName:"house.fill")
                    }
                }
            }
            .onAppear {
                presentSideMenu = false
            }
        }
    }
}

struct HomeView: View {
    
    @Binding var selectedSideMenuTab: Int
    
    var body: some View {
        Image("Logo-BSG-Kali-Werra")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea()
            .opacity(0.05)

            VStack {
                Spacer()
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 180)
                    
                
                Image("Grafik_Kali-Wappen_Tradition-seit-1913")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Spacer()
                
                Text("Neuigkeiten")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedSideMenuTab = 1
                    }
                Spacer()
                Text("Verein")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedSideMenuTab = 2
                    }
                Spacer()
                Text("Mannschaften")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedSideMenuTab = 3
                    }
                Spacer()
                Text("Über uns")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedSideMenuTab = 4
                    }
                Spacer()
                Text("Sponsoren & Partner")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                    .onTapGesture {
                        selectedSideMenuTab = 5
                    }
                Spacer()
                Link("Online-Shop", destination: URL(string: "https://www.kali-werra-shop.de/")!)
                    .font(.title.bold())
                    .foregroundStyle(.black)
                Spacer()
                
                
                HStack {
                    Spacer()
                    Link(destination: URL(string: "https://www.facebook.com/BSGKaliWerraTiefenort")!) {
                        Image("Facebook_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                    }
                    Spacer()
                    Link(destination: URL(string: "https://www.fussball.de/verein/bsg-kali-werra-tiefenort-thueringen/-/id/00ES8GNC5C00008NVV0AG08LVUPGND5I#!/")!) {
                        Image("fussball.de")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    Link(destination: URL(string: "https://www.instagram.com/kali_werra_tiefenort/?hl=de")!) {
                        Image("Instagram_logo_2016")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                    }
                    Spacer()
                }
                .padding()
        }
        
    }
}

#Preview {
    StartseiteView(presentSideMenu: .constant(false), selectedSideMenuTab: .constant(0))
}
