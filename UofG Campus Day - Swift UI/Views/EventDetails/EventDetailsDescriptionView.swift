//
//  EventDetailsDescriptionView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - EventDetailsDescriptionView

struct EventDetailsDescriptionView: View {

    // MARK: Lifecycle

    init(event: Event) {
        self.event = event
    }

    // MARK: Internal

    var body: some View {
        Text(event.description)
            .font(.system(size: 14))
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding([.top, .bottom], 10)
    }

    // MARK: Private

    let event: Event
}
