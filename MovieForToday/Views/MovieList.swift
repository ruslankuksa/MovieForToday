//
//  MovieList.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 17.11.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var networkManager = NetWorkManager()
    let imagesURL = "https://image.tmdb.org/t/p/w500"
    let mainURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "api_key=27147f4c44cc6fdf2e7f5b19e994a686"
    var parameter: String = ""
    
    var body: some View {
        List(networkManager.movies) { movie in
            HStack {
                ImageView(withURL: self.imagesURL + movie.poster_path!)
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title).font(.system(size: 20))
                    Text(movie.overview.prefix(200)).font(.system(size: 14))
                }
            }
        }
        .onAppear {
            self.networkManager.fetchData(withURL: self.mainURL+self.parameter+self.apiKey)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
