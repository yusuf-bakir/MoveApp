//
//  GenreEntitiy.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 5.05.2024.
//

import Foundation
// MARK: - GenreEntitiy

// MARK: - Genre
struct Genre: Codable {
    let genres: [GenreEntitiy]?
}

// MARK: - GenreElement
struct GenreEntitiy: Codable {
    let id: Int?
    let name: String?
}
