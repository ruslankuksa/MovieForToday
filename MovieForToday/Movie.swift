//
//  Movie.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 09.11.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let poster_path: String?
    let title: String
    let overview: String
    let vote_average: Double
    let release_date: String
}
