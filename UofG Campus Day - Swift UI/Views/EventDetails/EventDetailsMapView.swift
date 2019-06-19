//
//  EventDetailsMapView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI
import MapKit

// MARK: - EventDetailsMapView

struct EventDetailsMapView: View {

    // MARK: Lifecycle

    init(event: Event) {
        self.event = event
    }

    // MARK: Internal

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("pin")
                    .resizable()
                    .frame(width: 42, height: 42)
                Text(event.location)
            }
            EventMapView()
                .frame(height: isExpanded ? 210 : 110, alignment: .center)
                .padding([.leading, .trailing], 25)
                .tapAction {
                    withAnimation {
                        self.isExpanded.toggle()
                    }
                }
            Button(action: {

            }, label: {
                Text("Get Directions")
            }).foregroundColor(Color(red: 194/255, green: 4/255, blue: 48/255))
            .padding([.leading], 25)
            .padding([.top, .bottom], 10)
        }
    }

    // MARK: Private

    private let event: Event

    @State private var isExpanded = false
}
