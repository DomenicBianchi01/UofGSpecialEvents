//
//  EventDetailsHeaderView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - EventDetailsHeaderView

struct EventDetailsHeaderView: View {

    // MARK: Lifecycle

    init(event: Event) {
        self.event = event
    }

    // MARK: Internal

    var body: some View {
        VStack(alignment: .center) {
            Text(event.name)
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            Text(event.date + " @ " + event.startTime + " - " + event.endTime)
                .font(.system(size: 14))
                .color(.secondary)
                .multilineTextAlignment(.center)
                //.lineLimit(nil) //SwiftUI Bug: Setting lineLimit twice will break multiline all together
        }.padding([.top, .bottom], 20)
    }

    // MARK: Private

    private let event: Event
}
