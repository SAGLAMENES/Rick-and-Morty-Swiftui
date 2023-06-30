//
//  RAMModel.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 24.06.2023.
//

import Foundation
struct Welcome: Codable {
    let info: Info
    let results: [Result]?
}

struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}


struct Result: Codable, Identifiable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case genderless = "Genderless"
}

struct Location: Codable {
    let name: String
    let url: String
}


