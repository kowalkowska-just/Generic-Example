//
//  Person.swift
//  Generic
//
//  Created by Justyna Kowalkowska on 24/02/2021.
//

import Foundation

struct Person: Codable {
    let name: String
    let gender: String
    let homeworld: String
    let films: [String]
}
