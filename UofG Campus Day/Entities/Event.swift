//
//  Event.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

class Event: Decodable {
    // MARK: - Properties
    let id: Int
    let name: String
    let description: String
    let location: String
    let date: String
    let startTime: String
    let endTime: String
    let latitude: [Double]
    let longitude: [Double]
    
    // MARK: - Enums
    private enum Keys: String, CodingKey {
        case id
        case name
        case description
        case location
        case date
        case startTime
        case endTime
        case latitude = "lat"
        case longitude = "long"
    }
    
    // MARK: - Lifecycle Functions
    init(id: Int,
         name: String,
         description: String,
         location: String,
         date: String,
         startTime: String,
         endTime: String,
         latitude: [Double],
         longitude: [Double]) {
        
        self.id = id
        self.name = name
        self.description = description
        self.location = location
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let location = try container.decode(String.self, forKey: .location)
        let date = try container.decode(String.self, forKey: .date)
        let startTime = try container.decode(String.self, forKey: .startTime)
        let endTime = try container.decode(String.self, forKey: .endTime)
        let latitude = try container.decode([Double].self, forKey: .latitude)
        let longitude = try container.decode([Double].self, forKey: .longitude)
       
        self.init(id: id,
                  name: name,
                  description: description,
                  location: location,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                  latitude: latitude,
                  longitude: longitude)
    }
}
