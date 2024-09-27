//
//  SidebarMenu.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 20.08.24.
//

import SwiftUI

struct SidebarMenu: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .yellow.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(
                            isSelected: selectedSideMenuTab == row.rawValue,
                            title: row.title,
                            destination: row.destination(presentSideMenu: $presentSideMenu, selectedSideMenuTab: $selectedSideMenuTab)
                        ) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu = false
                        }
                    }
                    Spacer()
                }
                .padding(.top, 50)
                .frame(width: 270)
                .background(
                    Color.white
                )
            }
            Spacer()
        }
        .background(.clear)
    }
    
    func RowView(isSelected: Bool, title: String, destination: some View, action: @escaping() ->Void) -> some View{
        VStack(alignment: .leading){
            HStack(spacing: 20){
                Rectangle()
                    .fill(isSelected ? .black : .white)
                    .frame(width: 5)
                
                Text(title)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(isSelected ? .black : .gray)
                Spacer()
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .yellow.opacity(0.8) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
        .onTapGesture {
            action()
            
        }
    }
}
