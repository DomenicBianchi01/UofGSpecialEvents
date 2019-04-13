//
//  UserDefaultsExtensions.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-19.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

extension UserDefaults {
    /// Remove all data from the user defaults
    static func resetAppGroup() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
