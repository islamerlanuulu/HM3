//
//  CharactersViewModel.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 27/6/23.
//

import Foundation

class CharactersViewModel {
    let networkService = NetworkService()
    
    func fetchCharacters() async throws -> [Character] {
        return try await networkService.fetchCharacters()
    }
}
