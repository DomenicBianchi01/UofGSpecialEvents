//
//  ResidencesView.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2019-06-18.
//  Copyright © 2019 Domenic Bianchi. All rights reserved.
//

import SwiftUI

// MARK: - ResidencesView

struct ResidencesView : View {

    // MARK: Internal
    
    var body: some View {
        NavigationView {
            //NOTE (Possible SwiftUI bug?): If I do `List(Residence.ResidenceLocation.allCases) { ...`
            // the list will not layout correctly at all. Instead, it will generate three non-grouped
            // sections and display the rows that are supposed to be under each section as one row (basically one row per section).
            List {
                ForEach(Residence.ResidenceLocation.allCases) { location in
                    Section(
                        header: Text(self.viewModel.residenceName(for: location)),
                        footer: Text(self.viewModel.sectionFooter(for: location)).lineLimit(nil)) //TODO: Footer height is too short
                    {
                        ForEach(self.viewModel.residences(in: location)) { residence in
                            ResidenceDetailsView(residence: residence)
                        }
                    }
                }
            }.listStyle(.grouped)
            .navigationBarTitle(Text("Residences"))
        }
    }

    // MARK: Private

    private let viewModel = ResidencesViewModel()
}
