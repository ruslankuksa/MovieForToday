//
//  ContentView.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 20.10.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var networkManager = NetWorkManager()
    var imagesURL = "https://image.tmdb.org/t/p/w500"
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    SegmentPickerView()
                    List(networkManager.movies) { movie in
                        HStack {
                            ImageView(withURL: self.imagesURL + movie.poster_path)
                            Text(movie.title).font(.system(size: 20))
                        }
                    }.colorScheme(.dark)
                }
                .navigationBarTitle(Text("Movies"))
                .onAppear(perform: networkManager.fetchData)
            }
            .colorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
