//
//  City.swift
//  AustraliaTourPlan
//
//  Created by TDE Mackbook on 24/01/25.
//

import Foundation

struct City: Codable, Identifiable {
    let id = UUID()
    let city: String
    let lat: String
    let lng: String
    let country: String
    let admin_name: String
    let population: String

    enum CodingKeys: String, CodingKey {
        case city, lat, lng, country, admin_name, population
    }
}
