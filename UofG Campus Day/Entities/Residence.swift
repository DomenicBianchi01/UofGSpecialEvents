//
//  Residence.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import SwiftUI

class Residence: Decodable, Identifiable {
    // MARK: - Properties
    let id: Int
    let locationId: Int
    let name: String
    let style: ResidenceStyle
    let location: ResidenceLocation
    let types: RoomTypes
    
    // MARK: - Enums
    private enum Keys: String, CodingKey {
        case id
        case locationId
        case name
        case style
        case location
        case types
    }
    
    enum ResidenceLocation: Int, Identifiable {
        case south = 1
        case north
        case east
        case other // Only used as a default value

        var id: Int {
            return self.rawValue
        }

        //SwiftUI doesn't work with `CaseIterable`
        static var allCases: [ResidenceLocation] {
            return [.south, .north, .east]
        }
    }

    enum ResidenceStyle: Int {
        case traditional = 1
        case apartments
        case townhouse
        case suitesAndTraditional
        
        func asString() -> String {
            if self == .traditional {
                return "Traditional"
            } else if self == .apartments {
                return "Apartments"
            } else if self == .townhouse {
                return "Townhouse"
            } else {
                return "Suites & Traditional"
            }
        }
    }
    
    // MARK: - Structs
    struct RoomTypes: OptionSet {
        let rawValue: Int
        
        static let single = RoomTypes(rawValue: 1 << 0)
        static let double = RoomTypes(rawValue: 1 << 1)
        static let triple = RoomTypes(rawValue: 1 << 2)
        static let quad = RoomTypes(rawValue: 1 << 3)
    }
    
    // MARK: - Lifecycle Functions
    init(id: Int,
         locationId: Int,
         name: String,
         style: ResidenceStyle,
         location: ResidenceLocation,
         types: RoomTypes) {
        
        self.id = id
        self.locationId = locationId
        self.name = name
        self.style = style
        self.location = location
        self.types = types
    }
    
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let locationId = try container.decode(Int.self, forKey: .locationId)
        let name = try container.decode(String.self, forKey: .name)
        let style = try container.decode(Int.self, forKey: .style)
        let location = try container.decode(Int.self, forKey: .location)
        let types = try container.decode([Int].self, forKey: .types)
        
        var roomTypes: RoomTypes = []
        
        if types.contains(RoomTypes.single.rawValue) {
            roomTypes.insert(.single)
        }
        if types.contains(RoomTypes.double.rawValue) {
            roomTypes.insert(.double)
        }
        if types.contains(RoomTypes.triple.rawValue) {
            roomTypes.insert(.triple)
        }
        if types.contains(RoomTypes.quad.rawValue) {
            roomTypes.insert(.quad)
        }
        
        self.init(id: id,
                  locationId: locationId,
                  name: name,
                  style: ResidenceStyle(rawValue: style) ?? .traditional,
                  location: ResidenceLocation(rawValue: location) ?? .other,
                  types: roomTypes)
    }
}
