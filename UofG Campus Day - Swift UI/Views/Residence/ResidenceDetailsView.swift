//
//  ResidenceDetailsView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-18.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - ResidenceDetailsView

struct ResidenceDetailsView : View {

    // MARK: Lifecycle

    init(residence: Residence) {
        self.residence = residence
    }

    // MARK: Internal

    var body: some View {
        VStack(alignment: .leading) {
            Text(residence.name)
                .fontWeight(.semibold)
                .font(.system(size: 17))
            Text("Residence Style: " + residence.style.asString())
                .font(.system(size: 14))
                .color(.secondary)
            HStack {
                if residence.types.contains(.single) {
                    Image("single")
                }
                if residence.types.contains(.double) {
                    Image("double")
                }
                if residence.types.contains(.triple) {
                    Image("triple")
                }
                if residence.types.contains(.quad) {
                    Image("quad")
                }
            }
        }
    }

    // MARK: Private

    private let residence: Residence
}
