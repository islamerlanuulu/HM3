//
//  Character.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 27/6/23.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
