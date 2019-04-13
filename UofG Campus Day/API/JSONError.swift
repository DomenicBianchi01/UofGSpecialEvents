//
//  JSONError.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-12-30.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case noJsonFile
    case decodingError(Error)
}
