//
//  EventMapView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI
import MapKit

// MARK: - EventMapView

struct EventMapView: UIViewRepresentable {

    // MARK: Lifecycle

    init() {

    }

    // MARK: Internal

    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<EventMapView>) {
        
    }
}
