//
//  KontaktViewModel.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 18.09.24.
//

import Foundation
import MapKit
import _MapKit_SwiftUI


class KontaktViewModel: ObservableObject {
    @Published var camera: MapCameraPosition = MapCameraPosition.camera(
        MapCamera(centerCoordinate: .init(latitude: 50.84240822531988, longitude: 10.17660949440701),
                  distance: 500)
    )
    
    let place =
    Place(title: "Waldstadion Kaffeetälchen", location: .init(latitude: 50.84240822531988, longitude: 10.17660949440701))
    
}




