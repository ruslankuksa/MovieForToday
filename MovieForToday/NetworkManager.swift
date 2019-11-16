//
//  NetworkManager.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 01.11.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import Foundation

class NetWorkManager: ObservableObject {
    
    @Published var movies = [Movie]()
    var url: URL?
    
    func fetchData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=27147f4c44cc6fdf2e7f5b19e994a686&sort_by=popularity.desc") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.movies = results.results
                        for each in self.movies {
                            print(each)
                        }
                    }
                } catch {
                    print(error)
                }
            } else {
                guard let error = error else { return }
                print(error)
            }
        }
        task.resume()
    }
}
