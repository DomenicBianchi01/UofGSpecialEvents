//
//  JSONService.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-12-30.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

/// This is not a true JSON service in the sense that it does not make a network request. For the context of the this app, this class simply opens and reads a json file.
class JSONService {
    class func getData<D: Decodable>(from fileName: String, type: D.Type) throws -> D {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            throw JSONError.noJsonFile
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}
