//
//  Residences.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

class Residences: Decodable {
    // MARK: - Properties
    let residences: [Residence]
    let traditionalDefinition: String
    let suiteDefinition: String
    let apartmentDefinition: String
    
    // MARK: - Enums
    private enum Keys: String, CodingKey {
        case residences
        case traditional
        case suite
        case apartment
    }
    
    // MARK: - Lifecycle Functions
    init(residences: [Residence],
         traditional: String,
         suite: String,
         apartment: String) {
        self.residences = residences
        self.traditionalDefinition = traditional
        self.suiteDefinition = suite
        self.apartmentDefinition = apartment
    }
    
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let residences = try container.decode([Residence].self, forKey: .residences)
        let traditional = try container.decode(String.self, forKey: .traditional)
        let suite = try container.decode(String.self, forKey: .suite)
        let apartment = try container.decode(String.self, forKey: .apartment)
        
        self.init(residences: residences,
                  traditional: traditional,
                  suite: suite,
                  apartment: apartment)
    }
}
