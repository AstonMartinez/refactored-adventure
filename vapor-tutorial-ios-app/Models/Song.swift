//
//  Song.swift
//  vapor-tutorial-ios-app
//
//  Created by Aston Martinez on 12/14/23.
//

import Foundation
struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
