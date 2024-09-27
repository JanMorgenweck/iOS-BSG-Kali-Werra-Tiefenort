//
//  WelcomeView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 30.07.24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var navigateToAuthView = false
    @State private var navigateToMainView = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        ZStack {
            Image("Logo-BSG-Kali-Werra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .opacity(0.05)
            
            VStack {
                Spacer()
                Text("Willkommen")
                    .font(.largeTitle.bold())
                Text("bei der")
                    .font(.title.bold())
                Spacer()
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                Spacer()
                Text("BSG Kali Werra")
                    .font(.largeTitle.bold())
                Text("Tiefenort")
                    .font(.largeTitle.bold())
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation{
                    viewModel.phase = .auth
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AuthViewModel())
}
