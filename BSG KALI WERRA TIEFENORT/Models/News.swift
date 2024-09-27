//
//  News.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 21.08.24.
//

import Foundation

struct News: Decodable, Identifiable {
    var id = UUID()
    let image: String
    let header: String
    let date: String
    let shorttext: String
    let text: String
    let linktext: String?
    let link: String?
    let images: [String]
    
}
