//
//  Place.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//

import Foundation
import MapKit
import CoreLocation

struct Place: Identifiable {
    let id = UUID()
    let title: String
    let location: CLLocationCoordinate2D
    
    static let locations: [Place] = [
        .init(title: "WaldStadion Kaffeetälchen", location: CLLocationCoordinate2D(latitude: 50.84240822531988, longitude: 10.17660949440701)),
        
    ]
}
