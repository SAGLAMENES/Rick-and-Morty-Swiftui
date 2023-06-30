//
//  RAMLocations.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 26.06.2023.
//


// MARK: - Welcome
struct LocationData: Codable {
    let info: Info
    let results: [Locations]?
}
struct Locations: Codable, Identifiable, Equatable{
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
