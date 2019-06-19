//
//  EventView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - EventView

struct EventView: View {

    // MARK: Lifecycle

    init() {
        viewModel.decodeEvents()
    }

    // MARK: Internal

    var body: some View {
        NavigationView {
            List(viewModel.events) { event in
                NavigationButton(destination: EventDetailsView(event: event)) {
                    EventViewRow(event: event)
                }
            }.navigationBarTitle(Text("Events"))
        }
    }

    // MARK: Private

    private let viewModel = EventsViewModel()
}
