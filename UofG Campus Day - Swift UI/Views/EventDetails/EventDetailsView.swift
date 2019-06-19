//
//  EventDetailsView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - EventDetailsView

struct EventDetailsView: View {

    // MARK: Lifecycle

    init(event: Event) {
        self.event = event
    }

    // MARK: Internal

    var body: some View {
        List {
            EventDetailsHeaderView(event: self.event)
            EventDetailsDescriptionView(event: self.event)
            EventDetailsMapView(event: self.event)
        }.navigationBarTitle(Text("Event Details"))
    }

    // MARK: Private

    private let event: Event
}

