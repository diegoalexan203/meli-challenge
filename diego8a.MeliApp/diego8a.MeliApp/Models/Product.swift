//
//  Product.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation

struct Product: Codable {
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [Result]
    let sort: Sort

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort

    }
}


// MARK: - Sort
struct Sort: Codable {
    let id: String?
    let name: String
}


// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let permalink: String
    let thumbnail: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case permalink, thumbnail
        case price
    }
}

