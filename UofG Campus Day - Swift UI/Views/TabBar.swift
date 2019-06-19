//
//  TabBar.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-12.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - TabBar

struct TabBar: View {

    // MARK: Internal

    var body: some View {
        TabbedView {
            EventView()
                .tabItemLabel(VStack {
                    Image("event")
                    Text("Home")
                })
                .tag(0)
            EventView()
                .tabItemLabel(VStack {
                    Image("event")
                    Text("Home")
                })
                .tag(0)
            ResidencesView()
                .tabItemLabel(VStack {
                    Image("building")
                    Text("Residences")
                })
                .tag(1)
        }
    }
}
