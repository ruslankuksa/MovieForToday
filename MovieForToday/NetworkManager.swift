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
    
    func fetchData(withURL url: String) {
        guard let url = URL(string: url) else { return }
        print(url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.movies = results.results
                        self.movies = self.movies.filter { $0.poster_path != nil }
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
