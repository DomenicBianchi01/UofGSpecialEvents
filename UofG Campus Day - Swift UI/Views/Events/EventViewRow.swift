//
//  EventViewRow.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - EventViewRow

struct EventViewRow: View {

    // MARK: Lifecycle

    init(event: Event) {
        self.event = event
    }

    // MARK: Internal

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .fontWeight(.semibold)
                .font(.system(size: 17))
            Text(event.location)
                .font(.system(size: 13))
                .color(.secondary)
            Text(event.date + " @ " + event.startTime + " - " + event.endTime)
                .font(.system(size: 13))
        }.padding([.top, .bottom], 10)
    }

    // MARK: Private

    private let event: Event
}
