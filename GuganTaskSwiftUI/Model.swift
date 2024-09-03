//
//  Model.swift
//  GuganTaskSwiftUI
//
//  Created by Gugan on 03/09/24.
//

import Foundation

// MARK: - ModelData
struct ModelData: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, image, title: String
    let subtitle: [String]
}
