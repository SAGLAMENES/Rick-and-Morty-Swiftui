//
//  Ramchars.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 29.06.2023.
//

import Foundation
struct WelcomeElement: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

