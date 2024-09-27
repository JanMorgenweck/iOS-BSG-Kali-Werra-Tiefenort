//
//  SideMenu.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 20.08.24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isOpen: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isOpen) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isOpen.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(.clear)
            }
        }
    }
}

