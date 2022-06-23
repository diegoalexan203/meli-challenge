//
//  Categories.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 20/06/22.
//

import Foundation

// MARK: - Category
struct Category: Codable {
    let id, name: String
}

typealias Categories = [Category]
